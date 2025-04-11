import 'package:bloc/bloc.dart';
import 'package:live_news/presentation/view_models/subscription/subscription_event.dart';
import 'package:live_news/presentation/view_models/subscription/subscription_state.dart';
import '../../../data/models/model/subscribe_item_model.dart';
import '../../../data/repositories/subscribe_repository.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState>{

  List<SubscribeItemsModel> subscribeList = [];
  SubscribeRepository subscribeRepository;

  SubscriptionBloc(this.subscribeRepository) : super(const SubscriptionState()){
    on<FetchList>(fetchList);
    on<MyFavouriteSelect>(myFavouriteSelectedButton);
  }


  void fetchList(FetchList event, Emitter<SubscriptionState> emit) async{
    subscribeList = await subscribeRepository.fetchData();
    emit(state.copyWith(subscribeItemList: List.from(subscribeList), listStatus: ListStatus.success));
  }

  void myFavouriteSelectedButton(MyFavouriteSelect event, Emitter<SubscriptionState> emit) async{
    var index = subscribeList.indexWhere((element) => element.channelName == event.items.channelName);
    subscribeList[index] = event.items;
    emit(state.copyWith(subscribeItemList: List.from(subscribeList)));
  }

}
