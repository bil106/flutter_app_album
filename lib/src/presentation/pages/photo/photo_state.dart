part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<AlbumData>? photo;
  PhotoLoaded(this.photo);
}

class PhotoLoadFailed extends PhotoState {
  final String error;
  PhotoLoadFailed(this.error);
}

class PhotoLoading extends PhotoState {}
