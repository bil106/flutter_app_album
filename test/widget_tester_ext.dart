import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension WidgetTesterExt on WidgetTester {
  

  Future loadWidget({
    required Widget widget,
  }) async {

    await pumpWidget( MaterialApp( home: Scaffold(body: widget),
            
            ));
  }
}
Future loadPage({
  required Widget widget,
 
  MediaQueryData mediaQueryData = const MediaQueryData(
   
  ),
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("hi", "IN")],
      path: "assets/translations",
      fallbackLocale: const Locale("en", "US"),
     
      child: Builder(
        builder: (context) {
          context.setLocale(const Locale("en", "US"));
          return MediaQuery(
            data: mediaQueryData,
            child: MaterialApp(
              locale: context.locale,
              useInheritedMediaQuery: true,
              home: ProviderScope(
                overrides: [
                  
                ],
                child: widget,
              ),
            ),
          );
        },
      ),
    );


}

ProviderScope({required List overrides, required Widget child}) {
}
