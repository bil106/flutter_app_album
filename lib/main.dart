import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';
import 'package:flutter_app/src/common/http/api_client.dart';
import 'package:flutter_app/src/data/repositories/albums_repo.dart';
import 'package:flutter_app/src/data/repositories/photos_repo.dart';
import 'package:flutter_app/src/presentation/pages/allbum/albums_bloc.dart';
import 'package:flutter_app/src/presentation/pages/allbum/home_page.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_bloc.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_page.dart';
import 'package:flutter_app/src/presentation/pages/splash/splash_bloc.dart';
import 'package:flutter_app/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter_app/src/presentation/shared/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();


  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers(),
      child: _multiBlocProvider(),
    );
  }

  _multiBlocProvider() {
    return MultiProvider(
      providers: [
         BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
        BlocProvider<AlbumsBloc>(
            create: (context) => AlbumsBloc(context.read<AlbumsRepository>())),
        BlocProvider<PhotoBloc>(
          create: (context) => PhotoBloc(context.read<PhotoRepository>()),
        ),
      ],
      child: _materialApp(),
    );
  }

  List<SingleChildWidget> _providers() {
    return [
      Provider<Dio>(
        create: (context) => Dio(BaseOptions(contentType: 'application/json')),
      ),
      Provider<ApiClient>(create: (context) => ApiClient(context.read<Dio>())),
      Provider<AlbumsRepository>(
          create: (context) => AlbumsRepository(context.read<ApiClient>())),
      Provider<PhotoRepository>(
        create: (context) => PhotoRepository(context.read<ApiClient>()),
      ),
    ];
  }


_materialApp() {
  return MaterialApp(
    navigatorKey: NavigationService.navigationKey,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: kcBackgroundColor,
        appBarTheme: AppBarTheme(
            titleTextStyle: headingStyle(kcBlackColor),
            backgroundColor: kcPrimaryColor,
            iconTheme: const IconThemeData(color: kcPrimaryColor),
            elevation: 0)),
            onGenerateInitialRoutes: (route) {return[MaterialPageRoute(builder: (_) =>const HomePage(),) ];
              
            },navigatorObservers: [MyApp.routeObserver ],
            onGenerateRoute: onGenerateRoute,
  );
}



MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  debugPrint('build route for${settings.name}');
  debugPrint('args ${settings.arguments}');

String ronkStr = "ronk";
    ronk(context) => const SplashPage();

   var routes = <String, WidgetBuilder>{
     ronkStr: ronk,
      SplashPage.routeName: (context) => const SplashPage(),
    
    HomePage.routeName: (context) => const HomePage(),
    PhotoPage.routeName: (context) =>
        PhotoPage(args: settings.arguments as PhotoPageRouteArguments),

  };
 WidgetBuilder builder = routes[settings.name ] as WidgetBuilder;
 return MaterialPageRoute(builder:(context) => builder(context),settings: settings);
}
}