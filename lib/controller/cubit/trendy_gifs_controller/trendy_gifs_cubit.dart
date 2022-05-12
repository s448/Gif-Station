import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'trendy_gifs_state.dart';

//cubit for requesting the trendy route not the search route
class TrendyGifsCubit extends Cubit<TrendyGifsState> {
  TrendyGifsCubit(this.homeRepository) : super(TrendyGifsInitial());
  List<dynamic> trendyGifs = [];
  HomeRepository homeRepository;

  //return the trendy gifs and emit the loaded state
  List<dynamic> getTrendyGifs(String limit) {
    homeRepository.getTrendyGifs(limit).then((gifs) {
      emit(TrendyGifsLoaded(gifs));
      trendyGifs = gifs;
    });
    return trendyGifs;
  }
}
