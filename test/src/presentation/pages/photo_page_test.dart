import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_strings.dart';
import 'package:flutter_app/src/data/repositories/photos_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';

import 'package:flutter_app/src/presentation/pages/allbum/home_page.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_bloc.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_widget.dart';
import 'photo/photo_bloc_test.dart';

 class MockPhotoBloc extends Mock implements PhotoBloc {}

void main() {
  group('PhotoPage', () {
late PhotoBloc photoBloc;
late PhotoRepository photoRepo;
const albumId =0;
List<AlbumData> photo =[];

setUp(()async{
  photoBloc = MockPhotoBloc();
  photoRepo=MockPhotoRepository();
  when(()=> photoRepo.getPhotos( albumId)).thenAnswer((_) async => photo);
});

    Future loadWidget(
      WidgetTester tester,
      PhotoPage widget,
    ) async {
      await tester.loadWidget(
        widget:  PhotoPage(args: PhotoPageRouteArguments(albumId: albumId) ,),
      );
    }
   
    testWidgets(
      '1 test show PhotoPage,title,icon and photo title',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
           // await loadWidget(tester, PhotoPage(args: PhotoPageRouteArguments(albumId: albumId)));
            await tester.pumpPhotoPage(photoBloc: photoBloc);
           

            expect(find.byType(AppBar), findsOneWidget);
            expect(find.text(kAlbumPhotosTitle), findsOneWidget);


           
          },
        );
      },
    );
    
   
  });
}


extension on WidgetTester {
  Future<void> pumpPhotoPage({
    MockNavigator? navigator,
    required PhotoBloc photoBloc,
    
    PhotoRepository? photoRepo,
    
  }) {
    const albumId =0;
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: photoBloc),
          
        ],
        child:  PhotoPage(
            args: PhotoPageRouteArguments(albumId: albumId),
          )
      ),
   
    );
  }
}
