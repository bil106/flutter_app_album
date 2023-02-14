part of 'albums_bloc.dart';

@immutable
abstract class AlbumsEvent {}

class AlbumsBlocLoadAllEvent extends AlbumsEvent {}

class AlbumsBlocFilterByTitleEvent extends AlbumsEvent {
  final String title;
  AlbumsBlocFilterByTitleEvent(this.title);
}
