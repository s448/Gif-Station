import 'package:bloc/bloc.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:meta/meta.dart';

part 'stickers_view_state.dart';

class StickersViewCubit extends Cubit<StickersViewState> {
  StickersViewCubit(this.homeRepository) : super(StickersViewInitial());

  List<dynamic> stickers = [];
  HomeRepository homeRepository;

  //return stickers from home repository
  List<dynamic> getStickers(String limit) {
    homeRepository.getStickers(limit).then((stickers) {
      emit(StickersLoaded(stickers));
      stickers = stickers;
    });
    return stickers;
  }
}
