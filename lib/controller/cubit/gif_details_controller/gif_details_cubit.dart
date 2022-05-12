import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gif_details_state.dart';

class GifDetailsCubit extends Cubit<GifDetailsState> {
  GifDetailsCubit() : super(GifDetailsInitial());
}
