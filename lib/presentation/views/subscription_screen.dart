import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_news/data/repositories/subscribe_repository.dart';
import 'package:live_news/presentation/widgets/subscription_shimmer_effect.dart';
import '../view_models/subscription/subscription_bloc.dart';
import '../view_models/subscription/subscription_event.dart';
import '../view_models/subscription/subscription_state.dart';
import '../../data/models/model/subscribe_item_model.dart';
import '../widgets/searchbar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late final SubscriptionBloc _subscriptionBloc;
  final SubscribeRepository subscribeRepository = SubscribeRepository();

  @override
  void initState() {
    super.initState();
    _subscriptionBloc = SubscriptionBloc(subscribeRepository);
    _subscriptionBloc.add(FetchList());
  }

  @override
  void dispose() {
    _subscriptionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _subscriptionBloc,
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return SafeArea(child: subscriptionShimmerEffect());
              case ListStatus.failure:
                return const Text('Something went wrong');
              case ListStatus.success:
                return Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchBarWidget(
                          hintText: 'Search news here...',
                          suffixIcon: Icons.mic_none),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Popular Channels',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.subscribeItemList.length,
                            itemBuilder: (context, index) {
                              final items = state.subscribeItemList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage(items.newsImage),
                                          radius: 25,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items.channelName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.grey.shade200),
                                            ),
                                            Text(
                                              items.channelDesc,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.grey.shade400),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            SubscribeItemsModel itemModel =
                                                SubscribeItemsModel(
                                                    newsImage: items.newsImage,
                                                    channelName:
                                                        items.channelName,
                                                    channelDesc:
                                                        items.channelDesc,
                                                    isSubscribe:
                                                        items.isSubscribe
                                                            ? false
                                                            : true);
                                            _subscriptionBloc
                                                .add(MyFavouriteSelect(
                                                    items: itemModel));
                                          },
                                          icon: Icon(
                                              items.isSubscribe
                                                  ? Icons.bookmark
                                                  : Icons
                                                      .bookmark_border_outlined,
                                              size: 28,
                                              color: items.isSubscribe
                                                  ? const Color(0xffBB86FC)
                                                  : Colors.grey.shade200),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
