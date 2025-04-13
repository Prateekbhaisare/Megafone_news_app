import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:live_news/data/repositories/subscribe_repository.dart';
import 'package:live_news/presentation/widgets/subscription_shimmer_effect.dart';
import '../../status/enums.dart';
import '../view_models/subscription/subscription_bloc.dart';
import '../view_models/subscription/subscription_event.dart';
import '../view_models/subscription/subscription_state.dart';
import '../widgets/subscription_channel_cards.dart'; // Import the new widget

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late final SubscriptionBloc _subscriptionBloc;
  final SubscribeRepository subscribeRepository = SubscribeRepository();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _subscriptionBloc = SubscriptionBloc(subscribeRepository);
    _subscriptionBloc.add(FetchList());
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                return const Center(
                  child: Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.white),
                  ),
                );

              case ListStatus.success:
                return KeyboardVisibilityProvider(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search Bar
                        TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            _subscriptionBloc.add(SearchChannels(value));
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.grey.shade500),
                            ),
                            prefixIcon: const Icon(
                              Icons.search_outlined,
                              size: 35,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(
                              Icons.mic_none,
                              size: 30,
                              color: Colors.blueAccent.shade700,
                            ),
                            hintText: "Search news here...",
                            hintStyle: TextStyle(color: Colors.grey.shade200),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          'Popular Channels',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Show vertical list for both search & normal list
                        Expanded(
                          child: state.searchChannels.isNotEmpty || _searchController.text.isNotEmpty
                              ? state.searchChannels.isEmpty
                              ? Center(
                            child: Text(
                              'No channels found',
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          )
                              : ListView.builder(
                            itemCount: state.searchChannels.length,
                            itemBuilder: (context, index) {
                              final items = state.searchChannels[index];
                              return ChannelCard(items: items, bloc: _subscriptionBloc);
                            },
                          )
                              : ListView.builder(
                            itemCount: state.subscribeItemList.length,
                            itemBuilder: (context, index) {
                              final items = state.subscribeItemList[index];
                              return ChannelCard(items: items, bloc: _subscriptionBloc);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
