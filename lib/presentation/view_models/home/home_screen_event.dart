import 'package:equatable/equatable.dart';

sealed class HomeScreenEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchedDataOne extends HomeScreenEvent{}

class FetchedDataTwo extends HomeScreenEvent{}

class SearchItems extends HomeScreenEvent{
  final String searchNews;
  SearchItems(this.searchNews);
}
