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

// coverage:ignore-file
class _LineChartBarDataHelper {
  static LineChartBarData build({required List<double> values}) {
    return LineChartBarData(
      spots: values.toFlSpots(),
      belowBarData: BarAreaData(
        show: true,
        color: Colors.transparent,
      ),
      aboveBarData: BarAreaData(
        show: true,
        color: Colors.transparent,
      ),
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: CMDimens.d6,
            color: kAmaranthPrimary,
          );
        },
      ),
      color: kSilver,
      barWidth: CMDimens.d1,
    );
  }

  static const _maxSpotsToShowTooltips = 4;

  static List<ShowingTooltipIndicators> getShowingTooltipIndicators(
    LineChartBarData lineChartBarData,
    List<double> values,
    int? touchedIndex,
  ) {
    final showAllTooltips = values.length <= _maxSpotsToShowTooltips;

    if (showAllTooltips) {
      return values.showingTooltipOnSpots.map((index) {
        return ShowingTooltipIndicators([
          LineBarSpot(
            lineChartBarData,
            0,
            lineChartBarData.spots[index],
          ),
        ]);
      }).toList();
    }

    if (touchedIndex != null) {
      return [
        ShowingTooltipIndicators([
          LineBarSpot(
            lineChartBarData,
            0,
            lineChartBarData.spots[touchedIndex],
          ),
        ])
      ];
    }

    return [];
  }
}
