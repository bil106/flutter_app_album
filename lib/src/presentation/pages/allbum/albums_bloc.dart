

// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app/src/data/repositories/albums_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  final AlbumsRepository _repo;

  AlbumsBloc(this._repo) : super(AlbumsInitial()) {
    
    on<AlbumsBlocLoadAllEvent>(onAlbumsLoading);
    on<AlbumsBlocFilterByTitleEvent>(onAlbumsFiltering);
    
  }

  onAlbumsLoading(AlbumsBlocLoadAllEvent event, Emitter<AlbumsState> emit) async{
  try {
    emit(AlbumsLoading());

    List<AlbumData> albums = await _repo.getAlbums();

    emit(AlbumsLoaded(albums));
  } catch (e) {
    emit(AlbumsLoadFailed(e.toString()));
  }
  
  }

  onAlbumsFiltering(AlbumsBlocFilterByTitleEvent event, Emitter<AlbumsState> emit)async {
  try {
    emit(AlbumsLoading());

    List<AlbumData> albums = await _repo.getAlbumsByTitle(event.title);
    
      emit(AlbumsLoaded(albums));
  } catch (e) {
     emit(AlbumsLoadFailed(e.toString()));
  }
  
  }
} 