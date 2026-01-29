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
  testWidgets('Displays the correct text and profit value',
      (WidgetTester tester) async {
    const String testText = 'Total Revenue';
    const String testProfit = '100000';

    await tester.pumpWidget(baseComponentApp(
      CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    expect(find.text(testText), findsOneWidget);
    expect(find.text(testProfit.toMoneyFormat), findsOneWidget);
  });

  testWidgets('CMSummaryCard displays profit in green if positive',
      (WidgetTester tester) async {
    const String testText = 'Monthly Profit';
    const String testProfit = '50000';

    await tester.pumpWidget(baseComponentApp(
      CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    final profitTextWidget =
        tester.widget<Text>(find.text(testProfit.toMoneyFormat));
    expect(profitTextWidget.style?.color, kGreen);
  });

  testWidgets('CMSummaryCard displays profit in red if negative',
      (WidgetTester tester) async {
    const String testText = 'Monthly Loss';
    const String testProfit = '-15000';

    await tester.pumpWidget(baseComponentApp(
      CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    final profitTextWidget =
        tester.widget<Text>(find.text(testProfit.toMoneyFormat));
    expect(profitTextWidget.style?.color, kAmaranthPrimary);
  });

  testWidgets('CMSummaryCard displays profit with correct formatting',
      (WidgetTester tester) async {
    const String testText = 'Quarterly Earnings';
    const String testProfit = '123456789';

    await tester.pumpWidget(baseComponentApp(
      CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    expect(find.text(testProfit.toMoneyFormat), findsOneWidget);
  });
}
