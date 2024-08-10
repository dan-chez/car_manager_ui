import 'package:carmanager_ui/src/components/buttons/cm_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Displays the provided icon', (WidgetTester tester) async {
    const testIcon = Icons.add;

    await tester.pumpWidget(
      baseComponentApp(
        const CMIconButton(
          icon: Icon(testIcon),
          onPressed: null,
        ),
      ),
    );

    expect(find.byIcon(testIcon), findsOneWidget);
  });

  testWidgets('Triggers onPressed callback when tapped', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      baseComponentApp(
        CMIconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            wasPressed = true;
          },
        ),
      ),
    );

    await tester.tap(find.byType(CMIconButton));
    await tester.pumpAndSettle();

    expect(wasPressed, isTrue);
  });
}
