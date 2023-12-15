part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}


class shopSearchLoadingState extends SearchState {}

class shopSearchSuccessState extends SearchState {
  final SearchModel searchModel;

  shopSearchSuccessState(this.searchModel);
}

class shopSearchErrorState extends SearchState {
  String? error;
  shopSearchErrorState(this.error);
}
