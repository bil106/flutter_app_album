

import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/repositories/photos_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_event.dart';
part 'photo_state.dart';


class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository _repo;

  PhotoBloc(this._repo) : super(PhotoInitial()) {
    on<PhotoPageLoadEvent>(onGetPhotoForAlbum);   
  }

  onGetPhotoForAlbum(PhotoPageLoadEvent event, Emitter emit) async {
  try {
    emit(PhotoLoading());

    List<AlbumData> photo = await _repo.getPhotos(event. albumId);
  emit(PhotoLoaded(photo));
  
  } catch (e) {
    emit (PhotoLoadFailed(e.toString()));
  }
  }
}