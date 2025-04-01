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

import 'package:carmanager_ui/src/components/buttons/cm_date_button.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  group('CMDateButton', () {
    const String txtLabel = '01/01/2025';
    const String hintText = 'Select Date';
    bool onPressedCalled = false;

    Widget createWidgetUnderTest({Widget? icon}) {
      return baseComponentApp(
        CMDateButton(
          txtLabel: txtLabel,
          hintText: hintText,
          onPressed: () {
            onPressedCalled = true;
          },
          icon: icon ?? kDropdownIcon,
        ),
      );
    }

    setUp(() {
      onPressedCalled = false;
    });

    testWidgets('Renders correctly with texts and the default icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text(txtLabel), findsOneWidget);

      expect(find.text(hintText), findsOneWidget);

      expect(find.byIcon(kDropdownIcon.icon!), findsOneWidget);
    });

    testWidgets('Displays the correct text in the TextField',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final textField = find.byType(TextField);
      final textFieldWidget = tester.widget<TextField>(textField);
      expect(textFieldWidget.controller?.text, txtLabel);
    });

    testWidgets('Triggers onPressed when tapping on the TextField',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final textField = find.byType(TextField);
      await tester.tap(textField);
      await tester.pumpAndSettle();

      expect(onPressedCalled, isTrue);
    });

    testWidgets('Displays a custom icon when provided',
        (WidgetTester tester) async {
      const customIcon = Icon(Icons.calendar_today);
      await tester.pumpWidget(createWidgetUnderTest(icon: customIcon));

      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
    });
  });
}
