import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/src/common/exception/exception.dart';
import 'package:flutter_app/src/data/repositories/albums_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/allbum/albums_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';


class MockAlbumsRepository extends Mock implements AlbumsRepository{}

void main() {
 group('AlbumsBloc', () {
  final AlbumsRepository albumsRepo = MockAlbumsRepository();
  List<AlbumData> albums = [];
  String title = '';
   
   
   setUp(()async{});
   
   AlbumsBloc buildBloc(){return AlbumsBloc(albumsRepo);}
    blocTest<AlbumsBloc, AlbumsState>(
      '1 emits [AlbumsState] when AlbumsBlocLoadAllEvent.',
      build: () {
        when(() => albumsRepo.getAlbums())
            .thenAnswer((_) async => albums);
        return buildBloc();
      },
   
      act: (bloc) => bloc.add(AlbumsBlocLoadAllEvent()),
      expect: () => [isA<AlbumsLoading>(), isA<AlbumsLoaded>()],
      verify: (_) {
        verify(() => albumsRepo.getAlbums()).called(1);
      },
    );
     blocTest<AlbumsBloc, AlbumsState>(
      '2 emits [AlbumsState-AlbumsLoadFailed]error when AlbumsBlocLoadAllEvent.',
      build: () {
        when(() => albumsRepo.getAlbums()).thenThrow(ServerException('error'));
        return buildBloc();
      },
      act: (bloc) => bloc.add(AlbumsBlocLoadAllEvent()),
      expect: () => [isA<AlbumsLoading>(), isA<AlbumsLoadFailed>()],
      verify: (_) {
        verify(() => albumsRepo.getAlbums()).called(1);
      },
    );
     blocTest<AlbumsBloc, AlbumsState>(
      '3 emits [AlbumsState] when AlbumsBlocFilterByTitleEvent.',
      build: () {
        when(() => albumsRepo.getAlbumsByTitle(title)).thenAnswer((_) async => albums);
        return buildBloc();
      },
      act: (bloc) => bloc.add(AlbumsBlocFilterByTitleEvent(title)),
      expect: () => [isA<AlbumsLoading>(), isA<AlbumsLoaded>()],
      verify: (_) {
        verify(() => albumsRepo.getAlbumsByTitle(title)).called(1);
      },
    );
      blocTest<AlbumsBloc, AlbumsState>(
      '4 emits [AlbumsState-AlbumsLoadFailed]error when AlbumsBlocFilterByTitleEvent.',
      build: () {
        when(() => albumsRepo.getAlbumsByTitle(title))
           .thenThrow(ServerException('error'));
        return buildBloc();
      },
      act: (bloc) => bloc.add(AlbumsBlocFilterByTitleEvent(title)),
      expect: () => [isA<AlbumsLoading>(), isA<AlbumsLoadFailed>()],
      verify: (_) {
        verify(() => albumsRepo.getAlbumsByTitle(title)).called(1);
      },
    );
 });
}