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
class _FlTitlesDataHelper {
  static FlTitlesData build({
    required String xPrefix,
  }) {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 0.5,
          getTitlesWidget: (value, meta) {
            if (_allowedXValues.contains(value)) {
              return SideTitleWidget(
                meta: meta,
                child: Text(
                  '$xPrefix${value.toInt() + 1}',
                  style: kExpensesLineBottomTitleTextStyle,
                ),
              );
            }
            return SizedBox.shrink();
          },
          reservedSize: CMDimens.d30,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }
}
