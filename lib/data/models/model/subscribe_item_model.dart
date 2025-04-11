import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part '../adapter/subscribe_item_model.g.dart';

@HiveType(typeId: 2)
class SubscribeItemsModel extends Equatable {
  @HiveField(0)
  final String newsImage;
  @HiveField(1)
  final String channelName;
  @HiveField(2)
  final String channelDesc;
  @HiveField(3)
  final bool isSubscribe;

  const SubscribeItemsModel({required this.newsImage, required this.channelName, required this.channelDesc, this.isSubscribe = false});

  SubscribeItemsModel copyWith({String? newsImage, String? channelName, bool? isSubscribe, String? channelDesc}) {
    return SubscribeItemsModel(
        newsImage: newsImage ?? this.newsImage,
        channelName: channelName ?? this.channelName,
        isSubscribe: isSubscribe ?? this.isSubscribe,
        channelDesc: channelDesc ?? this.channelDesc
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [newsImage, channelName, isSubscribe, channelDesc];
}
