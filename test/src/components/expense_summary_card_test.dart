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

import 'package:carmanager_ui/src/components/expense_summary_card.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('CMExpenseSummaryCard displays description and value correctly', (WidgetTester tester) async {
    // Arrange
    const description = 'Office Supplies';
    const value = '500000';

    // Act
    await tester.pumpWidget(
      baseComponentApp(
        const CMExpenseSummaryCard(
          description: description,
          value: value,
        ),
      ),
    );

    // Assert
    expect(find.text(description), findsOneWidget);
    expect(find.text(value), findsOneWidget);
  });

  testWidgets('CMExpenseSummaryCard shows delete icon when showDeleteIcon is true', (WidgetTester tester) async {
    // Arrange
    const description = 'Employee Salaries';
    const value = '1200000';

    // Act
    await tester.pumpWidget(baseComponentApp(
      CMExpenseSummaryCard(
        description: description,
        value: value,
        showDeleteIcon: true,
        onDeletePressed: () {},
      ),
    ));

    // Assert
    expect(find.byIcon(kDeleteIcon.icon!), findsOneWidget);
  });

  testWidgets('CMExpenseSummaryCard does not show delete icon when showDeleteIcon is false',
      (WidgetTester tester) async {
    // Arrange
    const description = 'Utilities';
    const value = '150000';

    // Act
    await tester.pumpWidget(baseComponentApp(
      const CMExpenseSummaryCard(
        description: description,
        value: value,
        showDeleteIcon: false,
      ),
    ));

    // Assert
    expect(find.byIcon(kDeleteIcon.icon!), findsNothing);
  });

  testWidgets('CMExpenseSummaryCard triggers onDeletePressed callback when delete icon is pressed',
      (WidgetTester tester) async {
    // Arrange
    const description = 'Travel Expenses';
    const value = '75000';
    bool deletePressed = false;

    // Act
    await tester.pumpWidget(baseComponentApp(
      CMExpenseSummaryCard(
        description: description,
        value: value,
        showDeleteIcon: true,
        onDeletePressed: () {
          deletePressed = true;
        },
      ),
    ));

    // Tap the delete icon
    await tester.tap(find.byIcon(kDeleteIcon.icon!));
    await tester.pump();

    // Assert
    expect(deletePressed, isTrue);
  });
}
