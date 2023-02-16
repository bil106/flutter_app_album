import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mockingjay/mockingjay.dart';

 materialWidget(
    String? initialRoute,
    Map<String, WidgetBuilder> routes,
    NavigatorObserver navigatorObserver,
    [Widget? home,]
    ) {
  return EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/translations',
    child: Builder(
      builder: (context) {
        return MaterialApp(
          navigatorObservers: [navigatorObserver],
          home: home,
          initialRoute: initialRoute,
          routes: routes,
          localizationsDelegates: EasyLocalization.of(context)!.delegates,
          supportedLocales: EasyLocalization.of(context)!.supportedLocales,
          locale: EasyLocalization.of(context)!.locale,
        );
      },
    ),
  );
}


 materialWidget2(
    MockNavigator navigator,
    Widget home,
    ) {
  return EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/translations',
    child: Builder(
      builder: (context) {
        return MaterialApp(
          //navigatorObservers: [navigatorObserver],
          home: MockNavigatorProvider(navigator: navigator,child: home,),
          initialRoute: null,
          //routes: routes,
          localizationsDelegates: EasyLocalization.of(context)!.delegates,
          supportedLocales: EasyLocalization.of(context)!.supportedLocales,
          locale: EasyLocalization.of(context)!.locale,
        );
      },
    ),
  );
}