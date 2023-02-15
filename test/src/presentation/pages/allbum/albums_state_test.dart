import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/allbum/albums_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 group('AlbumsState', () {
  final List<AlbumData> albums=[];
   test('1[AlbumsState-AlbumsLoaded] when albums added', () {
     const stateA = AlbumsState;
     final stateB = AlbumsLoaded(albums);
     expect(stateB, isA<AlbumsState>());
     expect(stateA,isNot(stateB));
   });
   group('2 AlbumsState-AlbumsLoadFailed', () {

      final stateB = AlbumsLoaded(albums);
      final stateC = AlbumsLoadFailed('error');
      test('error when albums must been added', () {
      

        expect(stateC, isA<AlbumsState>());
        expect(stateC, isA<AlbumsLoadFailed>());
        expect(stateB, isNot(stateC));
      });
   });

    group('3 AlbumsState-AlbumsLoading', () {
      final stateB = AlbumsLoading();
      final stateC = AlbumsLoadFailed('error');
      test('state loading when albums must been added', () {

        expect(stateB, isA<AlbumsState>());
        expect(stateC, isA<AlbumsState>());
        expect(stateB, isA<AlbumsLoading>());
        expect(stateB, isNot(stateC));
      });
    });
    
 });
}