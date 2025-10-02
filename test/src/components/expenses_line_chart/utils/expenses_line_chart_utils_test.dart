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
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlSpotExtensions Tests', () {
    test('toFlSpots should convert the elements to FlSpot', () {
      final values = [10.0, 20.0, 30.0, 40.0, 50.0];
      final expectedSpots = [
        FlSpot(0.5, 10.0),
        FlSpot(1.5, 20.0),
        FlSpot(2.5, 30.0),
        FlSpot(3.5, 40.0),
        FlSpot(4.5, 50.0),
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

    test('showingTooltipOnSpots should return indices 0 to min(length, 5) - 1',
        () {
      final values = [10.0, 20.0, 30.0, 40.0, 50.0];
      expect(values.showingTooltipOnSpots, [0, 1, 2, 3, 4]);
    });

    test('showingTooltipOnSpots should return an empty list for an empty input',
        () {
      final values = <double>[];
      expect(values.showingTooltipOnSpots, isEmpty);
    });
  });

  group('List<double> getNiceInterval extension', () {
    test('should return null for an empty list', () {
      final List<double> values = [];
      expect(values.getNiceInterval(), isNull);
    });

    test('should return half the value for a list with identical values', () {
      final List<double> values = [100, 100, 100];
      expect(values.getNiceInterval(), 50);
    });

    test('should calculate a nice interval for a simple range', () {
      final List<double> values = [10, 40];
      // range = 30, rawInterval = 10, niceInterval = 10
      expect(values.getNiceInterval(), 10);
    });

    test('should calculate a nice interval for a larger range', () {
      final List<double> values = [0, 100];
      // range = 100, rawInterval = 25, niceInterval = 50
      expect(values.getNiceInterval(), 50);
    });

    test('should calculate a nice interval for a mid-range', () {
      final List<double> values = [20, 85];
      // range = 65, rawInterval = 16.25, niceInterval = 20
      expect(values.getNiceInterval(), 20);
    });

    test('should calculate a nice interval for a decimal range', () {
      final List<double> values = [0.1, 0.9];
      // range = 0.8, rawInterval = 0.2, niceInterval = 0.2
      expect(values.getNiceInterval(), 0.2);
    });

    test('should calculate a nice interval for a very large range', () {
      final List<double> values = [1000, 9000];
      // range = 8000, rawInterval = 2000, niceInterval = 2000
      expect(values.getNiceInterval(), 2000);
    });

    test('should calculate a nice interval for a range in the thousands', () {
      final List<double> values = [1500, 8500];
      // range = 7000, rawInterval = 1750, niceInterval = 2000
      expect(values.getNiceInterval(), 2000);
    });

    test(
        'should calculate a nice interval for a range in the hundreds of thousands',
        () {
      final List<double> values = [120000, 780000];
      // range = 660000, rawInterval = 165000, niceInterval = 200000
      expect(values.getNiceInterval(), 200000);
    });

    test('should calculate a nice interval for a range in the millions', () {
      final List<double> values = [1000000, 9000000];
      // range = 8000000, rawInterval = 2000000, niceInterval = 2000000
      expect(values.getNiceInterval(), 2000000);
    });

    group('with different list lengths', () {
      test('should work with 3 values', () {
        final List<double> values = [10, 20, 30];
        // range = 20, rawInterval = 5, niceInterval = 5
        expect(values.getNiceInterval(), 5);
      });

      test('should work with 4 values', () {
        final List<double> values = [100, 200, 300, 400];
        // range = 300, rawInterval = 75, niceInterval = 100
        expect(values.getNiceInterval(), 100);
      });

      test('should work with 6 values', () {
        final List<double> values = [50, 100, 150, 200, 250, 300];
        // range = 250, rawInterval = 62.5, niceInterval = 100
        expect(values.getNiceInterval(), 100);
      });

      test('should work with 8 values', () {
        final List<double> values = List.generate(8, (i) => (i + 1) * 1000.0);
        // range = 7000, rawInterval = 1750, niceInterval = 2000
        expect(values.getNiceInterval(), 2000);
      });

      test('should work with 10 values', () {
        final List<double> values = List.generate(10, (i) => i.toDouble());
        // range = 9, rawInterval = 2.25, niceInterval = 5
        expect(values.getNiceInterval(), 5);
      });

      test('should work with 12 values', () {
        final List<double> values = List.generate(12, (i) => (i + 1) * 10000.0);
        // range = 110000, rawInterval = 27500, niceInterval = 50000
        expect(values.getNiceInterval(), 50000);
      });
    });
  });
}
