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

import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [ExpensesLineChartShowcase] class provides a visual representation of [ExpensesLineChart].
class ExpensesLineChartShowcase extends StatelessWidget {
  /// This path is used to navigate to the ExpensesLineChart showcase using GoRouter.
  static String path = '/expensesLineChart';

  const ExpensesLineChartShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(title: 'ExpensesLineChart showcase', children: [
      createShowcaseTitle(
        'ExpensesLineChart displays a line chart with a maximum of 12 values (one per week or one per month).',
      ),
      createShowcaseTitle(
        'Displays a line chart with 12 values and custom x titles',
      ),
      const ExpensesLineChart(
        title: 'Expenses per month',
        xTitles: [
          'JAN',
          'FEB',
          'MAR',
          'APR',
          'MAY',
          'JUN',
          'JUL',
          'AUG',
          'SEP',
          'OCT',
          'NOV',
          'DEC',
        ],
        values: [
          300000,
          1200000,
          1500000,
          200000,
          500000,
          3500000,
          5000000,
          400000,
          5350340,
          1234567,
          1336568,
          7503020,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 11 values and custom x titles',
      ),
      const ExpensesLineChart(
        title: 'Expenses per month',
        xTitles: [
          'ENE',
          'FEB',
          'MAR',
          'ABR',
          'MAY',
          'JUN',
          'JUL',
          'AGO',
          'SEP',
          'OCT',
          'NOV',
          'DIC',
        ],
        values: [
          300000,
          1200000,
          1500000,
          200000,
          500000,
          3500000,
          5000000,
          400000,
          5350340,
          1234567,
          1336568,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 10 values and custom x prefix',
      ),
      const ExpensesLineChart(
        title: 'Expenses per month',
        xPrefix: 'M',
        values: [
          300000,
          1200000,
          1500000,
          200000,
          500000,
          3500000,
          5000000,
          400000,
          5350340,
          1234567,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 9 values and custom x prefix',
      ),
      const ExpensesLineChart(
        title: 'Expenses per month',
        xPrefix: 'M',
        values: [
          300000,
          1200000,
          1500000,
          200000,
          500000,
          3500000,
          5000000,
          400000,
          5350340,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 8 values and custom x prefix',
      ),
      const ExpensesLineChart(
        title: 'Expenses per month',
        xPrefix: 'M',
        values: [
          300000,
          1200000,
          1500000,
          200000,
          500000,
          3500000,
          5000000,
          400000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 6 values and custom x titles',
      ),
      const ExpensesLineChart(
        title: 'Expenses per month',
        xTitles: [
          'JAN',
          'FEB',
          'MAR',
          'APR',
          'MAY',
          'JUN',
          'JUL',
          'AUG',
          'SEP',
          'OCT',
          'NOV',
          'DEC',
        ],
        values: [
          300000,
          1200000,
          1500000,
          200000,
          500000,
          3500000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 4 values',
      ),
      const ExpensesLineChart(
        title: 'Expenses per week',
        xPrefix: 'W',
        values: [
          300000,
          1200000,
          1500000,
          200000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 4 values, each value being significantly greater than the previous one.',
      ),
      const ExpensesLineChart(
        title: 'Expenses per week',
        xPrefix: 'W',
        values: [
          100000,
          1000000,
          10000000,
          100000000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 3 values',
      ),
      const ExpensesLineChart(
        title: 'Expenses per week',
        xPrefix: 'W',
        values: [
          300000,
          1200000,
          1500000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 2 values',
      ),
      const ExpensesLineChart(
        title: 'Expenses per week',
        xPrefix: 'W',
        values: [
          300000,
          1200000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 1 values',
      ),
      const ExpensesLineChart(
        title: 'Expenses per week',
        xPrefix: 'W',
        values: [
          300000,
        ],
      ),
      createShowcaseTitle(
        'Displays a line chart with 0 values',
      ),
      const ExpensesLineChart(
        title: 'Expenses per week',
        xPrefix: 'W',
        values: [],
      ),
    ]);
  }
}
