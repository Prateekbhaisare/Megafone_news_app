import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_news/presentation/widgets/home_shimmer_effect.dart';
import 'package:live_news/presentation/widgets/latest_news.dart';
import 'package:live_news/presentation/widgets/trending_news.dart';
import 'package:live_news/data/repositories/home_repository_one.dart';
import 'package:live_news/data/repositories/home_repository_two.dart';
import '../../status/enums.dart';
import '../view_models/home/home_screen_bloc.dart';
import '../view_models/home/home_screen_event.dart';
import '../view_models/home/home_screen_state.dart';
import '../widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenBloc _homeScreenBloc;

  @override
  void initState() {
    super.initState();
    _homeScreenBloc = HomeScreenBloc();
    _fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _homeScreenBloc.close();
  }



  Future<void> _fetchData() async {
    _homeScreenBloc.add(FetchedDataOne());
    _homeScreenBloc.add(FetchedDataTwo());
  }

  Future<void> _refreshData() async {
    _homeScreenBloc.emit(const HomeScreenState(homeStatus: HomeStatus.loading));
    await Future.delayed(const Duration(microseconds: 500));
    _fetchData();
  }

  HomeRepositoryTwo homeRepositoryTwo = HomeRepositoryTwo();
  HomeRepositoryOne homeRepositoryOne = HomeRepositoryOne();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeScreenBloc,
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            switch (state.homeStatus) {
              case HomeStatus.loading:
                return SafeArea(child: homeShimmerEffect());
              case HomeStatus.failure:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message.toString(),
                      style: TextStyle(color: Colors.grey.shade200),
                    ),
                    ElevatedButton(
                        onPressed: _fetchData, child: const Text('Retry'))
                  ],
                ));
              case HomeStatus.success:
                return RefreshIndicator(
                  onRefresh: _refreshData,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Discover',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade200),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const SearchBarWidget(
                                    hintText: "Search news here...",
                                    suffixIcon: Icons.mic_none),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trending News',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade200),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                trendingNews(state, context),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Latest News',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade200),
                                    ),
                                    Text(
                                      'See More',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                latestNews(state, context),
                              ],
                            ),
                          ),
                        ],
                      ),
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
