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

import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

part 'helpers/fl_titles_data_helper.dart';

part 'helpers/line_chart_bar_data_helper.dart';

part 'utils/expenses_line_chart_utils.dart';

/// A line chart widget that displays up to four expense values, one per week.
///
/// It includes tooltips for each data point and dynamically calculates min/max values.
///
/// Example usage:
/// ```dart
/// ExpensesLineChart(
///   title: 'Expenses per week',
///   xPrefix: 'W',
///   values: [...],
/// )
/// ```
class ExpensesLineChart extends StatelessWidget {
  final String title;
  final String xPrefix;
  final List<double> values;

  const ExpensesLineChart({
    super.key,
    required this.title,
    required this.xPrefix,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    final lineChartBarData = _LineChartBarDataHelper.build(values: values);

    return Container(
      decoration: BoxDecoration(
        color: kLightAmaranthPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(CMDimens.d4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: CMDimens.d10,
          right: CMDimens.d16,
          top: CMDimens.d16,
          bottom: CMDimens.d12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kExpensesLineTitleTextStyle,
            ),
            const SizedBox(height: CMDimens.d16),
            AspectRatio(
              aspectRatio: 2.3,
              child: LineChart(
                LineChartData(
                  showingTooltipIndicators:
                      values.showingTooltipOnSpots.map((index) {
                    return ShowingTooltipIndicators([
                      LineBarSpot(
                        lineChartBarData,
                        0,
                        lineChartBarData.spots[index],
                      ),
                    ]);
                  }).toList(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: CMDimens.d4,
                      fitInsideHorizontally: true,
                      tooltipMargin: CMDimens.d8,
                      tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                      tooltipPadding: const EdgeInsets.all(CMDimens.d2),
                      getTooltipColor: (spot) => kExpensesLineChartBg,
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          return LineTooltipItem(
                            touchedSpot.y.toInt().toString().toMoneyFormat,
                            kExpensesLineToolTipTextStyle,
                          );
                        }).toList();
                      },
                    ),
                    getTouchedSpotIndicator: touchedSpotIndicator,
                  ),
                  lineBarsData: [lineChartBarData],
                  minY: values.minY,
                  minX: 0,
                  maxX: 4,
                  maxY: values.maxY,
                  titlesData: _FlTitlesDataHelper.build(xPrefix: xPrefix),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: kkAmaranthPrimaryWithOpacity),
                      bottom: BorderSide(color: kkAmaranthPrimaryWithOpacity),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
