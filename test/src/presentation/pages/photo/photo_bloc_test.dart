import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/src/common/exception/exception.dart';
import 'package:flutter_app/src/data/repositories/photos_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

class MockPhotoRepository extends Mock implements PhotoRepository{}

void main() {
 group('PhotoBloc', () {
  final PhotoRepository photoRepo=MockPhotoRepository();
  List<AlbumData> photo = [];
  int albumId = 0;
  
  setUp(()async{});
  
  PhotoBloc buildBloc (){return PhotoBloc(photoRepo);}

     blocTest<PhotoBloc, PhotoState>(
      '1 emits [PhotoState-PhotoLoaded] when PhotoPageLoadEvent.',
      build: () {
        when(() => photoRepo.getPhotos(albumId)).thenAnswer((_) async => photo);
        return buildBloc();
      },
      act: (bloc) => bloc.add(PhotoPageLoadEvent(albumId)),
      expect: () => [isA<PhotoLoading>(), isA<PhotoLoaded>()],
      verify: (_) {
        verify(() => photoRepo.getPhotos(albumId)).called(1);
      },
    );
         blocTest<PhotoBloc, PhotoState>(
      '2 emits [PhotoState-PhotoLoadFailed]error when PhotoPageLoadEvent.',
      build: () {
        when(() => photoRepo.getPhotos(albumId)).thenThrow(ServerException('error'));
        return buildBloc();
      },
      act: (bloc) => bloc.add(PhotoPageLoadEvent(albumId)),
      expect: () => [isA<PhotoLoading>(), isA<PhotoLoadFailed>()],
      verify: (_) {
        verify(() => photoRepo.getPhotos(albumId)).called(1);
      },
    );
 });
}