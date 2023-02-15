import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhotoState', () {
    final List<AlbumData> photo = [];
    test('1[PhotoState-PhotoLoaded] when photo added', () {
      const stateA = PhotoState;
      final stateB = PhotoLoaded(photo);
      expect(stateB, isA<PhotoState>());
      expect(stateA, isNot(stateB));
    });

    test('2[PhotoState-PhotoLoadFailed]error when photo must been added',
        () {
      final stateB = PhotoLoaded(photo);
      final stateC = PhotoLoadFailed('error');

      expect(stateC, isA<PhotoState>());
      expect(stateC, isA<PhotoLoadFailed>());
      expect(stateB, isNot(stateC));
    });

    test(
        '3[PhotoState-PhotoLoading]state loading when photo must been added',
        () {
      final stateA = PhotoState;
      final stateB = PhotoLoading();
      final stateC = PhotoLoadFailed('error');

      expect(stateB, isA<PhotoState>());
      expect(stateC, isA<PhotoState>());
      expect(stateB, isA<PhotoLoading>());
      expect(stateB, isNot(stateC));
    });
  });
}