import 'package:bloc/bloc.dart';
import 'package:live_news/presentation/view_models/subscription/subscription_event.dart';
import 'package:live_news/presentation/view_models/subscription/subscription_state.dart';
import '../../../data/models/model/subscribe_item_model.dart';
import '../../../data/repositories/subscribe_repository.dart';
import '../../../status/enums.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  List<SubscribeItemsModel> subscribeList = [];
  List<SubscribeItemsModel> channelSearchList = [];
  SubscribeRepository subscribeRepository;

  SubscriptionBloc(this.subscribeRepository)
      : super(const SubscriptionState()) {
    on<FetchList>(fetchList);
    on<MyFavouriteSelect>(myFavouriteSelectedButton);
    on<SearchChannels>(_fetchChannels);
  }

  void fetchList(FetchList event, Emitter<SubscriptionState> emit) async {
    subscribeList = await subscribeRepository.fetchData();
    emit(state.copyWith(
        subscribeItemList: List.from(subscribeList),
        listStatus: ListStatus.success));
  }

  void myFavouriteSelectedButton(
      MyFavouriteSelect event, Emitter<SubscriptionState> emit) async {
    var index = subscribeList.indexWhere(
        (element) => element.channelName == event.items.channelName);
    subscribeList[index] = event.items;
    emit(state.copyWith(subscribeItemList: List.from(subscribeList)));
  }

  void _fetchChannels(
      SearchChannels event, Emitter<SubscriptionState> emit) async {
    if (event.searchChannels.isEmpty) {
      emit(state.copyWith(searchChannels: []));
    } else {
      channelSearchList = subscribeList
          .where((channels) => channels.channelName
              .toString()
              .toLowerCase()
              .contains(event.searchChannels.toLowerCase()))
          .toList();

      emit(state.copyWith(searchChannels: channelSearchList));
    }
  }
}
