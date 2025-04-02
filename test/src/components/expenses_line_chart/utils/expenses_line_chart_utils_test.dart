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

import 'package:carmanager_ui/src/components/expenses_line_chart/expenses_line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlSpotExtensions Tests', () {
    test('toFlSpots should convert the first four elements to FlSpot', () {
      final values = [10.0, 20.0, 30.0, 40.0, 50.0];
      final expectedSpots = [
        FlSpot(0.5, 10.0),
        FlSpot(1.5, 20.0),
        FlSpot(2.5, 30.0),
        FlSpot(3.5, 40.0),
      ];

      expect(values.toFlSpots(), expectedSpots);
    });

    test('toFlSpots should return an empty list for an empty input', () {
      final values = <double>[];
      expect(values.toFlSpots(), isEmpty);
    });

    test('maxY should return the highest value plus 25%', () {
      final values = [10.0, 20.0, 30.0, 40.0];
      expect(values.maxY, 40.0 * 1.25);
    });

    test('maxY should return 0 for an empty list', () {
      final values = <double>[];
      expect(values.maxY, 0);
    });

    test('minY should return the lowest value multiplied by 0.5', () {
      final values = [10.0, 20.0, 30.0, 40.0];
      expect(values.minY, 10.0 * 0.5);
    });

    test('minY should return 0 for an empty list', () {
      final values = <double>[];
      expect(values.minY, 0);
    });

    test('showingTooltipOnSpots should return indices 0 to min(length, 4) - 1',
        () {
      final values = [10.0, 20.0, 30.0, 40.0, 50.0];
      expect(values.showingTooltipOnSpots, [0, 1, 2, 3]);
    });

    test('showingTooltipOnSpots should return an empty list for an empty input',
        () {
      final values = <double>[];
      expect(values.showingTooltipOnSpots, isEmpty);
    });
  });

  group('TouchedSpotIndicatorData Tests', () {
    test('touchedSpotIndicator should return a list of hidden indicators', () {
      final indicators = [0, 1, 2];
      final result =
          touchedSpotIndicator(LineChartBarData(spots: []), indicators);

      expect(result.length, indicators.length);
      for (final indicator in result) {
        expect(indicator.indicatorBelowLine.color, Colors.transparent);
      }
    });
  });
}
