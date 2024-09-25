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

/// The [ExpenseSummaryCardShowcase] class provides a visual representation of [ExpenseSummaryCard].
class ExpenseSummaryCardShowcase extends StatelessWidget {
  /// This path is used to navigate to the ExpenseSummaryCard showcase using GoRouter.
  static String path = '/expenseSummaryCard';

  const ExpenseSummaryCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onDeleteSnackBar = SnackBar(
      content: Text('onDelete pressed'),
    );

    final Map<String, String> expenseMap1 = {
      'Office Supplies': '500000',
      'Employee Salaries': '1200000',
      'Utilities': '150000',
    };

    final Map<String, String> expenseMap2 = {
      'Equipment Rental': '250000',
      'Maintenance': '300000',
      'Office Materials': '100000',
    };

    return ShowcaseAppBase(
      title: 'ExpenseSummaryCard showcase',
      children: [
        createShowcaseTitle(
          'Displays a card with a description and value. Includes an optional delete icon.',
        ),
        ExpenseSummaryCard(
          description: 'Monthly Subscription',
          value: '15000'.toMoneyFormat,
          onDeletePressed: () => showCustomSnackBar(context, onDeleteSnackBar),
        ),
        createShowcaseTitle(
          'Card with long description and delete icon.',
        ),
        ExpenseSummaryCard(
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rutrum lectus a condimentum scelerisque. Integer vel enim eget purus aliquam efficitur.',
          value: '23000'.toMoneyFormat,
          onDeletePressed: () => showCustomSnackBar(context, onDeleteSnackBar),
        ),
        createShowcaseTitle(
          'Card with only description and value, without delete icon.',
        ),
        ExpenseSummaryCard(
          description: 'Office Supplies',
          value: '75000'.toMoneyFormat,
        ),
        createShowcaseTitle(
          'Card with long description, without deletion icon.',
        ),
        ExpenseSummaryCard(
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rutrum lectus a condimentum scelerisque. Integer vel enim eget purus aliquam efficitur.',
          value: '85000'.toMoneyFormat,
        ),
        createShowcaseTitle(
          'Expense card list, without delete icon',
        ),
        ..._buildExpenseCards(expenseMap1),
        createShowcaseTitle(
          'Expense card list, with delete icon',
        ),
        ..._buildExpenseCards(
          expenseMap2,
          onDelete: () => showCustomSnackBar(context, onDeleteSnackBar),
        ),
      ],
    );
  }

  List<Widget> _buildExpenseCards(Map<String, String> expenseMap,
      {VoidCallback? onDelete}) {
    return expenseMap.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ExpenseSummaryCard(
          onDeletePressed: onDelete,
          description: entry.key,
          value: entry.value.toMoneyFormat,
        ),
      );
    }).toList();
  }
}
