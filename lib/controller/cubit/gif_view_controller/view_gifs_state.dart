part of 'view_gifs_cubit.dart';

@immutable
abstract class ViewGifsState {}

class ViewGifsInitial extends ViewGifsState {}

class GifsLoaded extends ViewGifsState {
  final List<dynamic> gifs;
  GifsLoaded(this.gifs);
}
