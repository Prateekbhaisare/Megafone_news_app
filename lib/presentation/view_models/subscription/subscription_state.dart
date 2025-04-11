import 'package:equatable/equatable.dart';
import '../../../data/models/model/subscribe_item_model.dart';

enum ListStatus {
  loading,
  success,
  failure
} // enum se ek undefined class bna skte hai

class SubscriptionState extends Equatable {
  final List<SubscribeItemsModel> subscribeItemList;
  final ListStatus listStatus;

  const SubscriptionState(
      {this.subscribeItemList = const [],
      this.listStatus = ListStatus.loading});

  SubscriptionState copyWith(
      {List<SubscribeItemsModel>? subscribeItemList, ListStatus? listStatus}) {
    return SubscriptionState(
        subscribeItemList: subscribeItemList ?? this.subscribeItemList,
        listStatus: listStatus ?? this.listStatus);
  }



  @override
  // TODO: implement props
  List<Object?> get props => [subscribeItemList, listStatus];
}
