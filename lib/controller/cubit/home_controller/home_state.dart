part of 'home_cubit.dart';

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
