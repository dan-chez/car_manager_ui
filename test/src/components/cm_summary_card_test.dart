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
import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('Displays the correct text and profit value', (WidgetTester tester) async {
    // Define test data
    const String testText = 'Total Revenue';
    const String testProfit = '100000';

    // Build the CMSummaryCard widget
    await tester.pumpWidget(baseComponentApp(
      const CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    // Verify if the text is displayed correctly
    expect(find.text(testText), findsOneWidget);

    // Verify if the profit is displayed correctly
    expect(find.text(testProfit.toMoneyFormat), findsOneWidget);
  });
  testWidgets('CMSummaryCard displays profit in green if positive', (WidgetTester tester) async {
    // Define test data
    const String testText = 'Monthly Profit';
    const String testProfit = '50000'; // Positive value

    // Build the CMSummaryCard widget
    await tester.pumpWidget(baseComponentApp(
      const CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    // Verify if the profit text color is green for positive values
    final profitTextWidget = tester.widget<Text>(find.text(testProfit.toMoneyFormat));
    expect(profitTextWidget.style?.color, kGreen); // Adjust color to your specific green
  });
  testWidgets('CMSummaryCard displays profit in red if negative', (WidgetTester tester) async {
    // Define test data
    const String testText = 'Monthly Loss';
    const String testProfit = '-15000'; // Negative value

    // Build the CMSummaryCard widget
    await tester.pumpWidget(baseComponentApp(
      const CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    // Verify if the profit text color is red for negative values
    final profitTextWidget = tester.widget<Text>(find.text(testProfit.toMoneyFormat));
    expect(profitTextWidget.style?.color, kAmaranthPrimary); // Adjust color to your specific red
  });

  testWidgets('CMSummaryCard displays profit with correct formatting', (WidgetTester tester) async {
    // Define test data
    const String testText = 'Quarterly Earnings';
    const String testProfit = '123456789'; // Large value

    // Build the CMSummaryCard widget
    await tester.pumpWidget(baseComponentApp(
      const CMSummaryCard(
        text: testText,
        profit: testProfit,
      ),
    ));

    // Verify if the profit text has the correct formatting
    expect(find.text(testProfit.toMoneyFormat), findsOneWidget);
  });
}
