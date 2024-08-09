import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Displays both light and bold titles correctly', (WidgetTester tester) async {
    const lightTitle = 'Welcome to';
    const boldTitle = 'Flutter';

    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: lightTitle,
          boldTitle: boldTitle,
        ),
      ),
    );

    expect(find.text(lightTitle), findsOneWidget);
    expect(find.text(boldTitle), findsOneWidget);
  });

  testWidgets('Applies correct text styles to light and bold titles', (WidgetTester tester) async {
    const lightTitle = 'Hello';
    const boldTitle = 'World';

    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: lightTitle,
          boldTitle: boldTitle,
        ),
      ),
    );

    final lightTitleText = tester.widget<Text>(find.text(lightTitle));
    final boldTitleText = tester.widget<Text>(find.text(boldTitle));

    expect(lightTitleText.style?.fontWeight, FontWeight.w300);
    expect(boldTitleText.style?.fontWeight, FontWeight.w600);
  });

  testWidgets('Displays bottom divider when showBottomDivider is true', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: 'Hello',
          boldTitle: 'World',
          showBottomDivider: true,
        ),
      ),
    );

    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('Does not display bottom divider when showBottomDivider is false', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: 'Hello',
          boldTitle: 'World',
          showBottomDivider: false,
        ),
      ),
    );

    expect(find.byType(Divider), findsNothing);
  });
}
