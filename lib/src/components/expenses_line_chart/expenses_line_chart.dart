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

import 'dart:math';

import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

part 'helpers/fl_titles_data_helper.dart';

part 'helpers/line_chart_bar_data_helper.dart';

part 'utils/expenses_line_chart_utils.dart';

/// A line chart widget that displays a series of expense values.
///
/// It includes tooltips for each data point and dynamically calculates min/max values
/// for the y-axis. The x-axis labels can be provided either as a list of strings
/// (`xTitles`) or generated using a prefix (`xPrefix`).
///
/// Example usage with `xPrefix`:
/// ```dart
/// ExpensesLineChart(
///   title: 'Weekly Expenses',
///   xPrefix: 'W',
///   values: [150.0, 200.0, 180.0, 220.0],
/// )
/// ```
///
/// Example usage with `xTitles`:
/// ```dart
/// ExpensesLineChart(
///   title: 'Monthly Expenses',
///   xTitles: ['Jan', 'Feb', 'Mar', 'Apr'],
///   values: [500.0, 450.0, 600.0, 550.0],
/// )
/// ```
class ExpensesLineChart extends StatefulWidget {
  final String title;
  final String? xPrefix;
  final List<String>? xTitles;
  final List<double> values;

  const ExpensesLineChart({
    super.key,
    required this.title,
    this.xPrefix,
    this.xTitles,
    required this.values,
  }) : assert(
          xPrefix != null || xTitles != null,
          'Either xPrefix or xTitles must be provided.',
        );

  @override
  State<ExpensesLineChart> createState() => _ExpensesLineChartState();
}

class _ExpensesLineChartState extends State<ExpensesLineChart> {
  int? _touchedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.values.isNotEmpty) {
      _touchedIndex = widget.values.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lineChartBarData =
        _LineChartBarDataHelper.build(values: widget.values);

    final maxX = widget.values.length < 4 ? 4 : widget.values.length;

    return Container(
      decoration: const BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: kBoxShadowColor,
              blurRadius: CMDimens.d4,
              offset: Offset(CMDimens.d0, CMDimens.d5),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(CMDimens.d6))),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColorWithOpacityBG,
          borderRadius: BorderRadius.all(Radius.circular(CMDimens.d6)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(CMDimens.d16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: kExpensesLineTitleTextStyle,
              ),
              const SizedBox(height: CMDimens.d16),
              AspectRatio(
                aspectRatio: 2.3,
                child: LineChart(
                  LineChartData(
                    showingTooltipIndicators:
                        _LineChartBarDataHelper.getShowingTooltipIndicators(
                      lineChartBarData,
                      widget.values,
                      _touchedIndex,
                    ),
                    lineTouchData: LineTouchData(
                      enabled: true,
                      handleBuiltInTouches: false,
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBorderRadius: BorderRadius.circular(CMDimens.d4),
                        tooltipMargin: CMDimens.d8,
                        tooltipPadding: const EdgeInsets.all(CMDimens.d2),
                        getTooltipColor: (spot) => kExpensesLineChartBg,
                        getTooltipItems: (List<LineBarSpot> touchedSpots) {
                          return touchedSpots.map((touchedSpot) {
                            return LineTooltipItem(
                              touchedSpot.y.toInt().toString().toMoneyFormat,
                              kExpensesLineToolTipTextStyle,
                            );
                          }).toList();
                        },
                      ),
                      // coverage:ignore-start
                      touchCallback: (FlTouchEvent event,
                          LineTouchResponse? touchResponse) {
                        if (event is FlTapUpEvent &&
                            touchResponse?.lineBarSpots != null &&
                            touchResponse?.lineBarSpots?.isNotEmpty == true) {
                          final spotIndex =
                              touchResponse?.lineBarSpots!.first.spotIndex;

                          setState(() {
                            _touchedIndex = spotIndex;
                          });
                        }
                      },
                      // coverage:ignore-end
                    ),
                    lineBarsData: [lineChartBarData],
                    minX: 0,
                    maxX: maxX.toDouble(),
                    minY: widget.values.minY,
                    maxY: widget.values.maxY,
                    titlesData: _FlTitlesDataHelper.build(
                      xPrefix: widget.xPrefix,
                      xTitles: widget.xTitles,
                      values: widget.values,
                    ),
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
      ),
    );
  }
}
