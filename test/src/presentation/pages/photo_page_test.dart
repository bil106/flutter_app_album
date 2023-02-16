import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_strings.dart';
import 'package:flutter_app/src/data/repositories/photos_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';

import 'package:flutter_app/src/presentation/pages/allbum/home_page.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_bloc.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_page.dart';
import 'package:flutter_app/src/widgets/photo_card_widget.dart';
import 'package:flutter_app/src/widgets/primary_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';


import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../test_widget.dart';


 class MockPhotoBloc extends Mock implements PhotoBloc {}
 class MockPhotoRepository extends Mock implements PhotoRepository {}
class MockNavigatorObserver extends Mock implements NavigatorObserver {}
void main() {
  group('PhotoPage', () {
final PhotoBloc photoBloc=MockPhotoBloc();
final PhotoRepository photoRepo=MockPhotoRepository();
final NavigatorObserver mockObserver = MockNavigatorObserver();
const albumId =0;
final photo =[AlbumData(albumId: albumId,id:0,title: '',url: '',thumbnailUrl: '')];

setUp(()async{
   SharedPreferences.setMockInitialValues({});
      await EasyLocalization.ensureInitialized();
  
});
    Widget myMaterialWidget() {
      return materialWidget(
        PhotoPage.routeName,
        {
          PhotoPage.routeName: (context) => PhotoPage(
                args: PhotoPageRouteArguments(albumId: albumId),
              ),
         HomePage.routeName:(context) =>const HomePage()
        },
        mockObserver,
      );
    }
    Widget testWidget(
      PhotoRepository photoRepository,
      NavigatorObserver mockObserver,
    ) {
      return MediaQuery(
        data: const MediaQueryData(),
        child: MultiProvider(
          providers: [
          Provider<PhotoRepository>(create: (context) => photoRepo),
          BlocProvider<PhotoBloc>( create: (context) => photoBloc),
           
           
          ],
          child: myMaterialWidget(),
        ),
      );
    }
    Widget widgetForTests() {
      return testWidget(
        photoRepo,
        mockObserver,
      );
    }
    
    testWidgets(
      '1 test show PhotoPage,title,icon and photo title',
      (WidgetTester tester) async {
        when(() => photoRepo.getPhotos(albumId)).thenAnswer((_) async => photo);
        await tester.runAsync(
          () async {
            
           tester.pumpPhotoPage;
          await tester.pumpAndSettle();
        

            expect(find.byType(AppBar), findsNothing);
            expect(find.text(kAlbumPhotosTitle), findsNothing);


           
          },
        );
      },
    );
    
   
  });
}


extension on WidgetTester {
  Future<void> pumpPhotoPage({
   
    required PhotoBloc photoBloc,
    
    PhotoRepository? photoRepo,
    
  }) {
    const albumId =0;
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: photoBloc),
          Provider<PhotoRepository>(create: (context) => photoRepo!,)
        ],
        child:  PhotoPage(
            args: PhotoPageRouteArguments(albumId: albumId),
          )
      ),
   
    );
  }
}
