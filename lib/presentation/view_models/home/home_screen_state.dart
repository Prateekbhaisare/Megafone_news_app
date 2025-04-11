import 'package:equatable/equatable.dart';
import 'package:live_news/data/models/model/home_model_two.dart';
import '../../../data/models/model/home_model_one.dart';
import '../../../status/enums.dart';

class HomeScreenState extends Equatable {
  final HomeStatus homeStatus;
  final List<ArticleModelOne> articleModel;
  final String message;
  final String searchMessage;
  final List<ArticleModelTwo> articleModelTwo;
  final List<ArticleModelOne> tempSearchList;

  const HomeScreenState({
    this.homeStatus = HomeStatus.loading,
    this.articleModel = const <ArticleModelOne>[],
    this.message = '',
    this.searchMessage = '',
    this.articleModelTwo = const <ArticleModelTwo>[],
    this.tempSearchList = const <ArticleModelOne>[],
  });

  HomeScreenState copyWith(
      {HomeStatus? homeStatus,
      List<ArticleModelOne>? articleModel,
      String? message,
      List<ArticleModelTwo>? articleModelTwo,
      List<ArticleModelOne>? tempSearchList,
      String? searchMessage
      }) {
    return HomeScreenState(
      homeStatus: homeStatus ?? this.homeStatus,
      articleModel: articleModel ?? this.articleModel,
      message: message ?? this.message,
      articleModelTwo: articleModelTwo ?? this.articleModelTwo,
      tempSearchList: tempSearchList ?? this.tempSearchList,
      searchMessage: searchMessage ?? this.searchMessage
    );
  }

  @override
  List<Object?> get props =>
      [homeStatus, articleModel, message, articleModelTwo, tempSearchList, searchMessage];
}
