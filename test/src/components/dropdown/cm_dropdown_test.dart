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

import 'package:carmanager_ui/src/components/dropdown/cm_dropdown.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Dropdown renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMDropdown(
          items: const {'1': 'Option 1', '2': 'Option 2'},
          labelText: 'Select an option',
          hintText: 'Please select',
          disabledHintText: 'No options available',
          onItemSelected: (value, key) {},
        ),
      ),
    );

    expect(find.text('Select an option'), findsOneWidget);
    expect(find.text('Please select'), findsOneWidget);
  });

  testWidgets('Dropdown disabled when items empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMDropdown(
          items: const {},
          labelText: 'Select an option',
          hintText: 'Please select',
          disabledHintText: 'No options available',
          onItemSelected: (value, key) {},
        ),
      ),
    );

    expect(find.text('No options available'), findsOneWidget);
  });

  testWidgets('Item selection triggers callback', (WidgetTester tester) async {
    String? selectedValue;
    String? selectedKey;

    await tester.pumpWidget(
      baseComponentApp(
        CMDropdown(
          items: const {'1': 'Option 1', '2': 'Option 2'},
          labelText: 'Select an option',
          hintText: 'Please select',
          disabledHintText: 'No options available',
          onItemSelected: (value, key) {
            selectedValue = value;
            selectedKey = key;
          },
        ),
      ),
    );

    await tester.tap(find.byType(CMDropdown));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Option 1').last);
    await tester.pumpAndSettle();

    expect(selectedValue, 'Option 1');
    expect(selectedKey, '1');
  });
}
