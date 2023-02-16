import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_page.dart';
import 'package:flutter_app/src/widgets/album_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../widget_tester_ext.dart';


void main() {
 group('AlbumCardWidget', () {
 
  
  const albumId =0;
  const id =0;
  const title ='';
  const url ='';
  const thumbnailUrl ='';
  final model = AlbumData(albumId: albumId,id: id,title: title,url: url,thumbnailUrl: thumbnailUrl );
   
    
  
  Future loadWidget(
      WidgetTester tester,
      AlbumCardWidget widget,
    ) async {
      await tester.loadWidget(
        widget:  AlbumCardWidget(model: model,onTap: () {
          
        },),
      );
    }
    group('AlbumCardWidget', () {
       testWidgets('1 test show image and title ', (tester) async {
        await mockNetworkImages(() async {
        
          await loadWidget(tester, AlbumCardWidget(model: model, onTap: () {}));

          expect(find.byType(ListTile), findsOneWidget);
          expect(find.byType(Column), findsWidgets);
          expect(find.byType(CachedNetworkImage), findsOneWidget);
          expect(find.text(model.title), findsOneWidget);
        });
      });
    });
    
        group('AlbumCardWidget tap', () {
          final navigator = MockNavigator();
      testWidgets('2 test navigate ', (tester) async {
        await mockNetworkImages(() async {
         
          when(() => navigator.pushNamed(PhotoPage.routeName,
              arguments: any(named: 'arguments'))).thenAnswer((_) async => {});
          await loadWidget(tester, AlbumCardWidget(model: model, onTap: () {}));

          expect(find.byType(ListTile), findsOneWidget);        
          expect(find.text(model.title), findsOneWidget);

          await tester.tap(find.text(model.title));
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          verifyNever(
            () => navigator.pushNamed(PhotoPage.routeName,
                arguments: any(named: 'arguments')),
          ).called(0);
         
        });
      });
    });
    
    group('AlbumCardWidget error', () {
     
      final model = AlbumData(
          albumId: albumId,
          id: id,
          title: title,
          url: null,
          thumbnailUrl: thumbnailUrl);
      testWidgets('2 test if error url ', (tester) async {
        await mockNetworkImages(() async {
         
          await loadWidget(tester, AlbumCardWidget(model: model, onTap: () {}));

          expect(find.byType(ListTile), findsOneWidget);
          expect(find.text(model.title), findsOneWidget);

          await tester.tap(find.text(model.title));
          expect(find.byType(SizedBox), findsOneWidget);
          
        });
      });
    });
    });
   }
 
 