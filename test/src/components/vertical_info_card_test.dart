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

import 'package:carmanager_ui/src/components/vertical_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  test('Constructor creates instance with correct properties', () {
    const card = VerticalInfoCard(
      textValue: '100',
      textDescription: 'Total Items',
    );

    expect(card.textValue, '100');
    expect(card.textDescription, 'Total Items');
  });

  testWidgets(
      'VerticalInfoCard displays textValue and textDescription correctly',
      (WidgetTester tester) async {
    const String testValue = '75%';
    const String testDescription = 'Success Rate';

    await tester.pumpWidget(baseComponentApp(
      const VerticalInfoCard(
        textValue: testValue,
        textDescription: testDescription,
      ),
    ));

    expect(find.text(testValue), findsOneWidget);
    expect(find.text(testDescription), findsOneWidget);
  });

  testWidgets('VerticalInfoCard adjusts to full width',
      (WidgetTester tester) async {
    const String testValue = '75%';
    const String testDescription = 'Success Rate';
    const double width = 263.11;

    await tester.pumpWidget(baseComponentApp(
      const SizedBox(
        width: width,
        child: VerticalInfoCard(
          textValue: testValue,
          textDescription: testDescription,
        ),
      ),
    ));

    final baseSize = tester.getSize(find.byType(VerticalInfoCard));
    expect(baseSize.width, equals(width));
  });
}
