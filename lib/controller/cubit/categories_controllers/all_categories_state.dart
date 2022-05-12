part of 'all_categories_cubit.dart';

@immutable
abstract class AllCategoriesState {}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesDataLoaded extends AllCategoriesState {
  final List<dynamic> allCategories;
  AllCategoriesDataLoaded(this.allCategories);
}
