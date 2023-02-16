import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/widgets/photo_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhotoCardWidget', () {
    
    final model = AlbumData(
      albumId: 0,
      id: 0,
      title: '',
      url: '',
      thumbnailUrl: '',
    );
    group('PhotoCardWidget when model added', () {
          testWidgets('renders CachedNetworkImage if model is not null',
          (tester) async {
        await tester.pumpWidget(
          PhotoCardWidget(
            model: model,
            onTap: () {},
          ),
        );
        expect(find.byType(CachedNetworkImage), findsOneWidget);
      });
    });


group('PhotoCardWidget if url incorrect', () {
  final modelUrlError = AlbumData(
        albumId: 0,
        id: 0,
        title: '',
        url: null,
        thumbnailUrl: null,
      );
      testWidgets('not renders CachedNetworkImage if url is empty',
          (tester) async {
        await tester.pumpWidget(
          PhotoCardWidget(
            model: modelUrlError,
            onTap: () {},
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
      });
});

  });
}
