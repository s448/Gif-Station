import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'gif_view_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  List<dynamic> trendyGifs = [];
  List<dynamic> categoriesList = [];
  List<dynamic> gifsList = [];
  HomeCubit(this.homeRepository) : super(HomeInitial());

  List<dynamic> getAllGifs(String query, String limit) {
    homeRepository.getTrendyGifs(query, limit).then((gifs) {
      emit(HomeDataLoaded(gifs));
      trendyGifs = gifs;
    });
    return trendyGifs;
  }

  List<dynamic> getAllCategories(String limit) {
    homeRepository.getCategories(limit).then((categories) {
      emit(CategoriesDataLoaded(categories));
      categoriesList = categories;
    });
    return categoriesList;
  }

  List<dynamic> getAllSearchedGifs(String query) {
    homeRepository.getGifs(query).then((g) {
      emit(CategoriesDataLoaded(g));
      gifsList = g;
    });
    return gifsList;
  }
}
