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

import '../base/base_component_app.dart';

void main() {
  group('ReportTile Widget Tests', () {
    testWidgets('Displays the correct text and formatted value',
        (WidgetTester tester) async {
      const testText = 'Monday 19';
      const testValue = '1000';

      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: testText,
            value: testValue,
            onPressed: () {},
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.text(testValue.toMoneyFormat), findsOneWidget);
    });

    testWidgets(
        'Displays the delete and edit icons when showDeleteAndEditIcon is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: '50000',
            onPressed: () {},
            onDelete: () {},
            showDeleteAndEditIcon: true,
          ),
        ),
      );

      expect(find.byIcon(kEditReportIcon.icon!), findsOneWidget);
      expect(find.byType(CMIconButton), findsOneWidget);
      expect(find.byIcon(kDeleteIcon.icon!), findsOneWidget);
    });

    testWidgets(
        'Hides delete and edit icons when showDeleteAndEditIcon is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: '50000',
            onPressed: () {},
            showDeleteAndEditIcon: false,
          ),
        ),
      );

      expect(find.byIcon(kEditReportIcon.icon!), findsNothing);
      expect(find.byType(CMIconButton), findsNothing);
      expect(find.byIcon(kArrowForwardIcon.icon!), findsOneWidget);
    });

    testWidgets('Triggers onPressed when the ReportTile is pressed',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: '500',
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      );

      await tester.tap(find.byType(ReportTile));
      await tester.pumpAndSettle();

      expect(pressed, isTrue);
    });

    testWidgets('Triggers onDelete when the delete button is pressed',
        (WidgetTester tester) async {
      bool deleted = false;

      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: '30000',
            onPressed: () {},
            onDelete: () {
              deleted = true;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(kDeleteIcon.icon!));
      await tester.pumpAndSettle();

      expect(deleted, isTrue);
    });

    testWidgets('Formats the value correctly as currency',
        (WidgetTester tester) async {
      const testValue = '150000';

      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: testValue,
            onPressed: () {},
          ),
        ),
      );

      expect(find.text(testValue.toMoneyFormat), findsOneWidget);
    });

    testWidgets('Applies correct color based on value being profit or not',
        (WidgetTester tester) async {
      const profitValue = '100000';
      const lossValue = '-50000';

      // Test for profit
      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: profitValue,
            onPressed: () {},
          ),
        ),
      );

      final profitText =
          tester.widget<Text>(find.text(profitValue.toMoneyFormat));
      expect(profitText.style?.color, kGreen);

      // Test for loss
      await tester.pumpWidget(
        baseComponentApp(
          ReportTile(
            text: 'Monday 19',
            value: lossValue,
            onPressed: () {},
          ),
        ),
      );

      final lossText = tester.widget<Text>(find.text(lossValue.toMoneyFormat));
      expect(lossText.style?.color, kAmaranthPrimary);
    });
  });
}
