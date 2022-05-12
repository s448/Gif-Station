part of 'trendy_gifs_cubit.dart';

@immutable
abstract class TrendyGifsState {}

class TrendyGifsInitial extends TrendyGifsState {}

class TrendyGifsLoaded extends TrendyGifsState {
  final List<dynamic> trendyGifs;
  TrendyGifsLoaded(this.trendyGifs);
}
