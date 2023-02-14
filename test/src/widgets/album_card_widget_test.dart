import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/widgets/album_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../test_widget.dart';

class MockAlbumData extends Mock implements AlbumData{}

void main() {
 group('AlbumCardWidget', () {
  final AlbumData albumData = MockAlbumData();
  const albumId =0;
  const id =0;
  const title ='';
  const url ='';
  const thumbnailUrl ='';
  final model = albumData;
   
   setUp(()async{});
   
   Future loadWidget(
      WidgetTester tester,
      AlbumCardWidget widget,
    ) async {
      await tester.loadWidget(
        widget:  AlbumCardWidget(model: model,onTap: (){},),
      );
    }
     testWidgets('1 AlbumCardWidget find title this widget', (tester) async {
      await loadWidget(
        tester,
         AlbumCardWidget(
          model: model,
          onTap: () {},
          ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      //expect(find.text(model.title), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      
    });
 });
}