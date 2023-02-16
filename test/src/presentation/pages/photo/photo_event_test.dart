import 'package:flutter_app/src/presentation/pages/photo/photo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhotoEvent', () {
    group('PhotoPageLoadEvent', () {
      const albumId = 0;

      test('PhotoPageLoadEvent', () {
        expect(PhotoPageLoadEvent(albumId), isA<PhotoPageLoadEvent>());
      });
    });
  });
}
