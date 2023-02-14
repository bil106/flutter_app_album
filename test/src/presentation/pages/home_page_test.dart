import 'package:flutter/material.dart';

import 'package:flutter_app/src/presentation/pages/allbum/home_page.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../test_widget.dart';

void main() {
  group('HomePage', () {
final navigator = MockNavigator();

    Future loadWidget(
      WidgetTester tester,
      HomePage widget,
    ) async {
      await tester.loadWidget(
        widget: const HomePage(),
      );
    }

    testWidgets(
      '1 test show HomePage,title,icon and album title',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await loadWidget(tester, const HomePage());
            await tester.pump();
            await tester.pumpAndSettle();

            expect(find.byType(AppBar), findsOneWidget);
            expect(find.text('Listing albums'), findsOneWidget);
            expect(find.byIcon(Icons.compare_arrows), findsOneWidget);
            expect(find.byType(Row), findsOneWidget);
           

            await tester.tap(find.byType(Column));

            // verifyNever(
            //   () => navigator.pushNamed(PhotoPage.routeName,
            //       arguments: any(named: 'arguments')),
            // ).called(0);
          },
        );
      },
    );
    
    testWidgets(
      '2 test, show button for title sort',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await loadWidget(tester, const HomePage());
            await tester.pump();
            await tester.pumpAndSettle();

            expect(find.byType(RotatedBox), findsOneWidget);
            expect(find.byIcon(Icons.compare_arrows), findsOneWidget);
            expect(find.text('Ascending'), findsOneWidget);
            
          await tester.tap(find.text('Ascending'));
          },
        );
      },
    );
  });
}
