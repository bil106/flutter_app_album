import 'package:flutter_app/src/presentation/pages/allbum/albums_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlbumsEvent', () {
    group('AlbumsBlocLoadAllEvent', () {
      test('AlbumsBlocFilterByTitleEvent', () {
        const title = '';
        final AlbumsBlocFilterByTitleEvent event =
            AlbumsBlocFilterByTitleEvent(title);
        expect(event, event);
      });
    });
  });
}
