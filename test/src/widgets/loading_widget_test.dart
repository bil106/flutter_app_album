import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/loading_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 group('LoadingWidget', () {
   testWidgets('test when show CircularProgressIndicator', (tester) async {

    await tester.pumpWidget(const LoadingWidget());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
   });
 });
}