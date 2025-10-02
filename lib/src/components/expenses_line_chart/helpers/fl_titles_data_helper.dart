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
    String? xPrefix,
    List<String>? xTitles,
    required List<double> values,
  }) {
    final prefixTextSize = values.length < 10 ? CMDimens.d15 : CMDimens.d10;
    final showLeftTitles = values.length > 4;
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
            maxIncluded: false,
            interval: values.getNiceInterval(),
            showTitles: showLeftTitles,
            reservedSize: CMDimens.d40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                meta: meta,
                child: Text(
                  meta.formattedValue.toString(),
                  style: kExpensesLineBottomTitleTextStyle.copyWith(
                    fontSize: CMDimens.d10,
                  ),
                ),
              );
            }),
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
              final index = value.toInt();
              String text;
              if (xTitles != null && index < xTitles.length) {
                final originalText = xTitles[index];
                final maxLength = values.length > 6 ? 2 : 3;
                text = originalText.length > maxLength
                    ? originalText.substring(0, maxLength)
                    : originalText;
              } else {
                text = '$xPrefix${index + 1}';
              }
              return SideTitleWidget(
                meta: meta,
                child: Text(
                  text,
                  style: kExpensesLineBottomTitleTextStyle.copyWith(
                    fontSize: prefixTextSize,
                  ),
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
