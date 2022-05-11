part of 'gif_view_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoaded extends HomeState {
  final List<dynamic> gifs;
  HomeDataLoaded(this.gifs);
}

class CategoriesDataLoaded extends HomeState {
  final List<dynamic> categories;
  CategoriesDataLoaded(this.categories);
}

class SearchedGifsLoaded extends HomeState {
  final List<dynamic> searchedGifs;
  SearchedGifsLoaded(this.searchedGifs);
}
