import 'package:bloc/bloc.dart';
import 'package:live_news/data/models/model/home_model_one.dart';
import 'package:live_news/data/repositories/home_repository_two.dart';
import '../../../data/repositories/home_repository_one.dart';
import '../../../status/enums.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  List<ArticleModelOne> tempSearchList = [];

  HomeScreenBloc() : super(const HomeScreenState()) {
    on<FetchedDataOne>(fetchApiDataOne);
    on<FetchedDataTwo>(fetchApiDataTwo);
    on<SearchItems>(_fetchList);
  }

  HomeRepositoryOne homeRepositoryOne = HomeRepositoryOne();
  HomeRepositoryTwo homeRepositoryTwo = HomeRepositoryTwo();

  void fetchApiDataOne(
      HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    if (state.articleModel.isEmpty) {
      emit(state.copyWith(homeStatus: HomeStatus.loading));
    }

    try {
      final value = await homeRepositoryOne.fetchList();
      emit(state.copyWith(
          homeStatus: state.articleModelTwo.isNotEmpty
              ? HomeStatus.success
              : state.homeStatus,
          articleModel: value));
    } catch (error) {
      emit(state.copyWith(
          homeStatus: HomeStatus.failure, message: error.toString()));
    }
  }

  void fetchApiDataTwo(
      HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    try {
      var value = await homeRepositoryTwo.fetchListTwo();
      emit(state.copyWith(
          articleModelTwo: value,
          homeStatus: state.articleModel.isNotEmpty
              ? HomeStatus.success
              : state.homeStatus));
    } catch (error) {
      // print(errors);
      // print(StackTrace);
      emit(state.copyWith(
          homeStatus: HomeStatus.failure, message: error.toString()));
    }
  }

  void _fetchList(SearchItems event, Emitter<HomeScreenState> emit) async {

    if(event.searchNews.isEmpty){
      emit(state.copyWith(tempSearchList: [], searchMessage: ''));
    }
    else{
      tempSearchList = state.articleModel
          .where((element) =>
      element.title.toString().toLowerCase().contains(event.searchNews.toLowerCase()))
          .toList();

      if(tempSearchList.isEmpty){
        emit(state.copyWith(tempSearchList: tempSearchList, searchMessage: 'No Data Found'));
      }
      else{
        emit(state.copyWith(tempSearchList: tempSearchList, searchMessage: ''));
      }
    }

  }
}
