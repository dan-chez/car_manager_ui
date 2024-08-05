import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart' show Icons, TextButton;
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('PrimaryButton shows the correct text', (WidgetTester tester) async {
    const labelText = 'Click Me';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          txtLabel: labelText,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text(labelText), findsOneWidget);
  });

  testWidgets('PrimaryButton is disabled when isEnabled is false', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          isEnabled: false,
          txtLabel: 'Disabled Button',
          onPressed: () {},
        ),
      ),
    );

    final button = tester.widget<TextButton>(find.byType(TextButton));
    expect(button.enabled, isFalse);
  });

  testWidgets('PrimaryButton shows loader when isLoading is true', (WidgetTester tester) async {
    const labelText = 'Loading Button';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          isLoading: true,
          txtLabel: labelText,
          onPressed: () {},
        ),
      ),
    );

    expect(find.byType(Loader), findsOneWidget);
    expect(find.text(labelText), findsNothing);
  });

  testWidgets('PrimaryButton displays icon when provided', (WidgetTester tester) async {
    const labelText = 'Button with Icon';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          txtLabel: labelText,
          onPressed: () {},
          icon: kAddExpenseIconWhite,
        ),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text(labelText), findsOneWidget);
  });

  testWidgets('PrimaryButton calls onPressed when tapped', (WidgetTester tester) async {
    bool wasPressed = false;
    const labelText = 'Click Me';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          txtLabel: labelText,
          onPressed: () {
            wasPressed = true;
          },
        ),
      ),
    );

    await tester.tap(find.text(labelText));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
