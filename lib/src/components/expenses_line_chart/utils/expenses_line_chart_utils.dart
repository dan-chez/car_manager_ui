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

final _allowedXValues = List.generate(12, (index) => index + 0.5);

extension FlSpotExtensions on List<double> {
  /// Converts the first twelve elements of the list into a list of [FlSpot].
  /// The x-values are assigned from [allowedValues], and y-values come from the list.
  ///
  /// Only the first twelve elements are converted; the rest are ignored.
  List<FlSpot> toFlSpots() {
    return List.generate(
      length.clamp(0, 12),
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
  /// Only the first twelve elements are converted; the rest are ignored.
  List<int> get showingTooltipOnSpots {
    return List.generate(length.clamp(0, 12), (index) => index);
  }

  /// Calculates a "nice" interval for a chart's axis.
  ///
  /// This method computes an interval that is easy for humans to read by
  /// finding a rounded value that appropriately divides the data range into
  /// a reasonable number of ticks (in this case, 5).
  ///
  /// Returns `null` if the list is empty. If all values are the same, it returns half of that value.
  double? getNiceInterval() {
    if (isEmpty) return null;

    final minValue = reduce((a, b) => a < b ? a : b);
    final maxValue = reduce((a, b) => a > b ? a : b);
    final range = maxValue - minValue;

    if (range == 0) return minValue / 2;

    const numTicks = 5;
    final rawInterval = range / (numTicks - 1);

    final magnitude = pow(10, (log(rawInterval) / ln10).floor());
    final residual = rawInterval / magnitude;

    num niceInterval;
    if (residual > 5) {
      niceInterval = 10 * magnitude;
    } else if (residual > 2) {
      niceInterval = 5 * magnitude;
    } else if (residual > 1) {
      niceInterval = 2 * magnitude;
    } else {
      niceInterval = magnitude;
    }

    return niceInterval.toDouble();
  }
}
