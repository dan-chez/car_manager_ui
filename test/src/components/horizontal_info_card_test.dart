import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('HorizontalInfoCard renders with provided textValue and textDescription', (WidgetTester tester) async {
    const textValue = '1000';
    const textDescription = 'Description';

    await tester.pumpWidget(
      baseComponentApp(
        const HorizontalInfoCard(
          textValue: textValue,
          textDescription: textDescription,
        ),
      ),
    );

    expect(find.text(textValue), findsOneWidget);
    expect(find.text(textDescription), findsOneWidget);
  });

  testWidgets('HorizontalInfoCard displays text with correct styles', (WidgetTester tester) async {
    const textValue = '1000';
    const textDescription = 'Description';

    await tester.pumpWidget(
      baseComponentApp(
        const HorizontalInfoCard(
          textValue: textValue,
          textDescription: textDescription,
        ),
      ),
    );

    final textValueWidget = tester.widget<Text>(find.text(textValue));
    final textDescriptionWidget = tester.widget<Text>(find.text(textDescription));

    expect(textValueWidget.style?.color, equals(kkMyrtleGreenWithOpacity));
    expect(textValueWidget.style?.fontSize, equals(kTitleTextStyle.fontSize));

    expect(textDescriptionWidget.style?.color, equals(kkMyrtleGreenWithOpacity));
    expect(textDescriptionWidget.style?.fontWeight, equals(FontWeight.w300));
  });

  testWidgets('HorizontalInfoCard has correct shadow and border radius', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const HorizontalInfoCard(
          textValue: '1000',
          textDescription: 'Description',
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container).first);
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.boxShadow?.first.color, equals(kBoxShadowColor));
    expect(decoration.borderRadius, equals(const BorderRadius.all(Radius.circular(6))));
  });
}
