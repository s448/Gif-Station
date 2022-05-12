part of 'stickers_view_cubit.dart';

@immutable
abstract class StickersViewState {}

class StickersViewInitial extends StickersViewState {}

class StickersLoaded extends StickersViewState {
  final List<dynamic> stickers;
  StickersLoaded(this.stickers);
}
