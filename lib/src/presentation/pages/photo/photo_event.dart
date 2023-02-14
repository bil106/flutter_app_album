part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent {}

class PhotoPageLoadEvent extends PhotoEvent {
  final int albumId;
  PhotoPageLoadEvent(this.albumId);
}
