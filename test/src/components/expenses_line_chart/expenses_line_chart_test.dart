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
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensesLineChart Widget Tests', () {
    testWidgets('renders without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpensesLineChart(
              title: 'Test Chart',
              xPrefix: 'W',
              values: [100, 200, 300, 400],
            ),
          ),
        ),
      );

      expect(find.byType(ExpensesLineChart), findsOneWidget);
    });

    testWidgets('renders correctly with given parameters',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ExpensesLineChart(
              title: 'Test Chart',
              xPrefix: 'W',
              values: [1000, 2000, 3000, 4000],
            ),
          ),
        ),
      );

      expect(find.text('Test Chart'), findsOneWidget);
      expect(find.byType(LineChart), findsOneWidget);
    });

    testWidgets('displays correct number of tooltip indicators',
        (WidgetTester tester) async {
      final List<double> testValues = [1000, 2000, 3000, 4000];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpensesLineChart(
              title: 'Tooltip Test',
              xPrefix: 'W',
              values: testValues,
            ),
          ),
        ),
      );

      final lineChartFinder = find.byType(LineChart);
      expect(lineChartFinder, findsOneWidget);

      final lineChart = tester.widget<LineChart>(lineChartFinder);
      expect(lineChart.data.showingTooltipIndicators.length, testValues.length);
    });

    testWidgets('renders correct minY and maxY values',
        (WidgetTester tester) async {
      final List<double> testValues = [1000, 2000, 3000, 4000];
      final expectedMinY = testValues.reduce((a, b) => a < b ? a : b) * 0.5;
      final expectedMaxY = testValues.reduce((a, b) => a > b ? a : b) * 1.25;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpensesLineChart(
              title: 'Range Test',
              xPrefix: 'W',
              values: testValues,
            ),
          ),
        ),
      );

      final lineChartFinder = find.byType(LineChart);
      final lineChart = tester.widget<LineChart>(lineChartFinder);

      expect(lineChart.data.minY, expectedMinY);
      expect(lineChart.data.maxY, expectedMaxY);
    });

    test('returns correct tooltip indicators', () {
      final List<double> values = [100, 200, 300, 400];

      expect(values.showingTooltipOnSpots.length, equals(values.length));
    });
  });
}
