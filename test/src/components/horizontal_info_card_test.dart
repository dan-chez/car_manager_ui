// Copyright 2024 Danchez
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets(
      'HorizontalInfoCard renders with provided textValue and textDescription',
      (WidgetTester tester) async {
    const textValue = '1000';
    const textDescription = 'Description';

    await tester.pumpWidget(
      baseComponentApp(
        HorizontalInfoCard(
          textValue: textValue,
          textDescription: textDescription,
        ),
      ),
    );

    expect(find.text(textValue), findsOneWidget);
    expect(find.text(textDescription), findsOneWidget);
  });

  testWidgets('HorizontalInfoCard displays text with correct styles',
      (WidgetTester tester) async {
    const textValue = '1000';
    const textDescription = 'Description';

    await tester.pumpWidget(
      baseComponentApp(
        HorizontalInfoCard(
          textValue: textValue,
          textDescription: textDescription,
        ),
      ),
    );

    final textValueWidget = tester.widget<Text>(find.text(textValue));
    final textDescriptionWidget =
        tester.widget<Text>(find.text(textDescription));

    expect(textValueWidget.style?.color, equals(kkMyrtleGreenWithOpacity));
    expect(textValueWidget.style?.fontSize, equals(kTitleTextStyle.fontSize));

    expect(
        textDescriptionWidget.style?.color, equals(kkMyrtleGreenWithOpacity));
    expect(textDescriptionWidget.style?.fontWeight, equals(FontWeight.w300));
  });

  testWidgets('HorizontalInfoCard has correct shadow and border radius',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        HorizontalInfoCard(
          textValue: '1000',
          textDescription: 'Description',
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container).first);
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.boxShadow?.first.color, equals(kBoxShadowColor));
    expect(decoration.borderRadius,
        equals(const BorderRadius.all(Radius.circular(6))));
  });
}
