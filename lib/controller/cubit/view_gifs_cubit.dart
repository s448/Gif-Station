import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'view_gifs_state.dart';

class ViewGifsCubit extends Cubit<ViewGifsState> {
  ViewGifsCubit(this.homeRepository) : super(ViewGifsInitial());
  List<dynamic> trendyGifs = [];
  HomeRepository homeRepository;
  //return the gifs that should be viewed in the view screen
  List<dynamic> getAllGifs(String query) {
    homeRepository.searchForGif(query).then((gifs) {
      emit(GifsLoaded(gifs));
      trendyGifs = gifs;
    });
    return trendyGifs;
  }
}
