import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'all_categories_state.dart';

//cubit for all categories screen
class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this.homeRepository) : super(AllCategoriesInitial());
  HomeRepository homeRepository;
  List<dynamic> allCategoriesList = [];

  //return and emit the categories
  List<dynamic> getAllCategories(String limit) {
    homeRepository.getCategories(limit).then((categories) {
      emit(AllCategoriesDataLoaded(categories));
      allCategoriesList = categories;
    });
    return allCategoriesList;
  }
}
