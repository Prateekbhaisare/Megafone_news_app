import 'package:equatable/equatable.dart';
import '../../../data/models/model/subscribe_item_model.dart';
import '../../../status/enums.dart';

class SubscriptionState extends Equatable {
  final List<SubscribeItemsModel> subscribeItemList;
  final List<SubscribeItemsModel> searchChannels;
  final ListStatus listStatus;

  const SubscriptionState(
      {this.subscribeItemList = const [],
      this.searchChannels = const [],
      this.listStatus = ListStatus.loading});

  SubscriptionState copyWith(
      {List<SubscribeItemsModel>? subscribeItemList,
      ListStatus? listStatus,
      List<SubscribeItemsModel>? searchChannels}) {
    return SubscriptionState(
        subscribeItemList: subscribeItemList ?? this.subscribeItemList,
        listStatus: listStatus ?? this.listStatus,
        searchChannels: searchChannels ?? this.searchChannels);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [subscribeItemList, listStatus, searchChannels];
}
