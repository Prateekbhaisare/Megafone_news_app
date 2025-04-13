import 'package:flutter/material.dart';
import '../../data/models/model/subscribe_item_model.dart';
import '../view_models/subscription/subscription_bloc.dart';
import '../view_models/subscription/subscription_event.dart';

class ChannelCard extends StatelessWidget {
  final SubscribeItemsModel items;
  final SubscriptionBloc bloc;

  const ChannelCard({super.key, required this.items, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(items.newsImage),
              radius: 25,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items.channelName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  Text(
                    items.channelDesc,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                bloc.add(MyFavouriteSelect(
                  items: SubscribeItemsModel(
                    newsImage: items.newsImage,
                    channelName: items.channelName,
                    channelDesc: items.channelDesc,
                    isSubscribe: !items.isSubscribe,
                  ),
                ));
              },
              icon: Icon(
                items.isSubscribe ? Icons.bookmark : Icons.bookmark_border_outlined,
                size: 28,
                color: items.isSubscribe ? const Color(0xffBB86FC) : Colors.grey.shade200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
