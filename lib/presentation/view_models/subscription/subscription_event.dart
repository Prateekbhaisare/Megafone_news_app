import 'package:equatable/equatable.dart';
import '../../../data/models/model/subscribe_item_model.dart';

sealed class SubscriptionEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchList extends SubscriptionEvent{}

class MyFavouriteSelect extends SubscriptionEvent{
  final SubscribeItemsModel items;
  MyFavouriteSelect({required this.items});
}

class SearchChannels extends SubscriptionEvent{
  final String searchChannels;
  SearchChannels(this.searchChannels);
}
