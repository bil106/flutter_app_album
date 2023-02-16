import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/heading/heading.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_tester_ext.dart';

void main() {
 group('Heading', () {
  Future loadWidget(
      WidgetTester tester,
      Heading widget,
    ) async {
      await tester.loadWidget(
        widget:const Heading(
          text: '',
        ),
      );
    }
   testWidgets('test, show heading text', (tester) async{

    await loadWidget(tester,const Heading(text: '',));
    expect(find.byType(Text), findsOneWidget);
   });
 });
}