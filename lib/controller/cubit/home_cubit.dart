import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

/*
this cubit is used in the home screen to return the head categories in home screen
*/
class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;

  List<dynamic> categoriesList = [];
  List<dynamic> allCategoriesList = [];
  List<dynamic> gifsList = [];
  HomeCubit(this.homeRepository) : super(HomeInitial());

  //emit categories in the home page
  List<dynamic> getCategories(String limit) {
    homeRepository.getCategories(limit).then((categories) {
      emit(CategoriesDataLoaded(categories));
      categoriesList = categories;
    });
    return categoriesList;
  }

  List<dynamic> getAllSearchedGifs(String limit) {
    homeRepository.searchForGif(limit).then((g) {
      emit(CategoriesDataLoaded(g));
      gifsList = g;
    });
    return gifsList;
  }
}
