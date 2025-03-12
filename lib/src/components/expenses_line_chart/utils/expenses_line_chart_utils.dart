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

part of '../expenses_line_chart.dart';

const _allowedXValues = [0.5, 1.5, 2.5, 3.5];

/// Returns a list of `TouchedSpotIndicatorData` with transparent lines and hidden dots.
/// This is used to customize the appearance of touched spots in a line chart.
List<TouchedSpotIndicatorData> touchedSpotIndicator(
  LineChartBarData _,
  List<int> indicators,
) {
  return indicators.map(
    (int index) {
      return const TouchedSpotIndicatorData(
        FlLine(color: Colors.transparent),
        FlDotData(show: false),
      );
    },
  ).toList();
}

extension FlSpotExtensions on List<double> {
  /// Converts the first four elements of the list into a list of [FlSpot].
  /// The x-values are assigned from [allowedValues], and y-values come from the list.
  ///
  /// Only the first four elements are converted; the rest are ignored.
  List<FlSpot> toFlSpots() {
    return List.generate(
      length.clamp(0, 4),
      (index) => FlSpot(_allowedXValues[index], this[index]),
    );
  }

  /// Returns the highest value in the list plus 25%.
  double get maxY {
    if (isEmpty) return 0;
    final maxValue = reduce((a, b) => a > b ? a : b);
    return maxValue * 1.25;
  }

  /// Returns the lowest value in the list multiplied by 0.5.
  double get minY {
    if (isEmpty) return 0;
    final minValue = reduce((a, b) => a < b ? a : b);
    return minValue * 0.5;
  }

  /// Generates a list of sequential indices from 0 to [length] - 1.
  /// This is used to show tooltips on all available spots.
  ///
  /// Only the first four elements are converted; the rest are ignored.
  List<int> get showingTooltipOnSpots {
    return List.generate(length.clamp(0, 4), (index) => index);
  }
}
