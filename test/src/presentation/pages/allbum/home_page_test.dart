import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_strings.dart';
import 'package:flutter_app/src/data/repositories/albums_repo.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/allbum/albums_bloc.dart';
import 'package:flutter_app/src/presentation/pages/allbum/home_page.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../test_widget.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([AlbumsRepository],
  customMocks: [
    MockSpec<NavigatorObserver>(onMissingStub: OnMissingStub.returnDefault)
  ],
)

void main() {
  late AlbumsBloc albumsBloc;
  late AlbumsRepository albumsRepository;
   late NavigatorObserver mockObserver ;
  group('HomePage', () {
     final albums = [AlbumData(albumId: 0, id: 0, title: 'title', url: 'url', thumbnailUrl: 'thumbnailUrl')];
    setUp(()async {
       SharedPreferences.setMockInitialValues({});
      await EasyLocalization.ensureInitialized();
      albumsRepository=MockAlbumsRepository();
      albumsBloc = MockAlbumsBloc();
      mockObserver=MockNavigatorObserver();
      
    });
     Widget myMaterialWidget() {
      return materialWidget(
        HomePage.routeName,
        {
          HomePage.routeName: (context) =>const HomePage(
                
              ),
          PhotoPage.routeName:(context) => PhotoPage(args:PhotoPageRouteArguments(albumId: 0) ,)
        },
        mockObserver,
      );
    }
   Widget testWidget(
     AlbumsRepository albumsRepository,
     AlbumsBloc albumsBloc,
      NavigatorObserver mockObserver,
    ) {
      return MediaQuery(
        data: const MediaQueryData(),
        child: MultiProvider(
          providers: [
            Provider<AlbumsRepository>(create: (context) => albumsRepository),
            Provider<AlbumsBloc>(
                create: (context) =>albumsBloc),
           
           
          ],
          child: myMaterialWidget(),
        ),
      );
    }
    testWidgets('test page transition (_FadeUpwardsPageTransition)', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Material(child: Text(kAlbumsTitle)),
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
        routes: <String, WidgetBuilder>{
          '/photo_page': (BuildContext context) {
            return const Material(child: Text(kAlbumPhotosTitle));
          },
        },
      ),
     
    );
      expect(find.text(kAlbumsTitle), isOnstage);
    
  });
  group('HomePage', () {
    testWidgets('AppBar', (WidgetTester tester) async{
       when(albumsRepository.getAlbums())
            .thenAnswer((_) async =>albums);
await tester.runAsync(
        () async {
       await tester.pumpWidget(testWidget(albumsRepository,albumsBloc,mockObserver));
      
       await tester.pumpAndSettle();
       
       expect(find.byType(AppBar), findsNothing);
    } );});
  });
}

 
  );} 