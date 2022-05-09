import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'gif_view_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  List<dynamic> trendyGifs = [];
  List<dynamic> categoriesList = [];
  HomeCubit(this.homeRepository) : super(HomeInitial());

  List<dynamic> getAllGifs() {
    homeRepository.getTrendyGifs().then((gifs) {
      emit(HomeDataLoaded(gifs));
      trendyGifs = gifs;
    });
    return trendyGifs;
  }

  List<dynamic> getAllCategories() {
    homeRepository.getCategories().then((categories) {
      emit(CategoriesDataLoaded(categories));
      categoriesList = categories;
    });
    return categoriesList;
  }
}
