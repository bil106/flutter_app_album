part of 'albums_bloc.dart';

@immutable
abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final List<AlbumData>? albums;
  AlbumsLoaded(this.albums);
}

class AlbumsLoadFailed extends AlbumsState {
  final String error;
  AlbumsLoadFailed(this.error);
}

class AlbumsLoading extends AlbumsState {}
