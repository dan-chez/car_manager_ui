import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PrimaryButton shows the correct text', (WidgetTester tester) async {
    const labelText = 'Click Me';
    await tester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          txtLabel: labelText,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text(labelText), findsOneWidget);
  });
}
