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

import 'package:carmanager_ui/src/components/buttons/secondary_button.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  group('SecondaryButton Widget Tests', () {
    testWidgets('Secondary button renders with correct label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SecondaryButton(label: 'Test Button', onPressed: () {}),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('Secondary button is disabled when isEnabled is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SecondaryButton(
              label: 'Disabled Button', onPressed: () {}, isEnabled: false),
        ),
      );

      final TextButton button = tester.widget(find.byType(TextButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('Secondary button is enabled when isEnabled is true',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        baseComponentApp(
          SecondaryButton(
            label: 'Enabled Button',
            onPressed: () => pressed = true,
            isEnabled: true,
          ),
        ),
      );

      await tester.tap(find.text('Enabled Button'));
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('Secondary button does not trigger onPressed when disabled',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        baseComponentApp(
          SecondaryButton(
            label: 'Disabled Button',
            onPressed: () => pressed = true,
            isEnabled: false,
          ),
        ),
      );

      await tester.tap(find.text('Disabled Button'));
      await tester.pump();

      expect(pressed, isFalse);
    });

    testWidgets(
        'Secondary button has icon and text and it has correct colors based on isEnabled',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SecondaryButton(
            label: 'Color Test',
            onPressed: () {},
            isEnabled: true,
          ),
        ),
      );

      final Text textWidget = tester.widget(find.text('Color Test'));
      final Icon iconWidget =
          tester.widget(find.byIcon(Icons.add_circle_outline));

      expect(textWidget.style?.color, kAmaranthPrimary);
      expect(iconWidget.color, kAmaranthPrimary);

      // Test for disabled state
      await tester.pumpWidget(
        baseComponentApp(
          SecondaryButton(
            label: 'Color Test',
            onPressed: () {},
            isEnabled: false,
          ),
        ),
      );

      final Text disabledTextWidget = tester.widget(find.text('Color Test'));
      final Icon disabledIconWidget =
          tester.widget(find.byIcon(Icons.add_circle_outline));

      expect(disabledTextWidget.style?.color, kSilver);
      expect(disabledIconWidget.color, kSilver);
    });
  });
}
