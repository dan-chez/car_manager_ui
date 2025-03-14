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

import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_items.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../base/base_component_app.dart';

// Mock NavigatorObserver to verify if Navigator.pop() is called
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late List<CarPickerItemData> testItems;
  late String selectedItem;
  late Function(String) mockOnItemSelected;
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    testItems = [
      CarPickerItemData(id: '1', name: 'Car 1', plate: 'Plate:|34'),
      CarPickerItemData(id: '2', name: 'Car 2', plate: 'Plate:|13'),
    ];
    selectedItem = '1';
    mockOnItemSelected = (String id) {};
    mockNavigatorObserver = MockNavigatorObserver();
  });

  Widget buildTestWidget() {
    return baseComponentApp(
      CarPickerItems(
        items: testItems,
        selectedItem: selectedItem,
        onItemSelected: mockOnItemSelected,
      ),
    );
  }

  testWidgets('Displays all car items', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());

    expect(find.text('Car 1'), findsOneWidget);
    expect(find.text('Car 2'), findsOneWidget);
  });

  testWidgets('Selecting a different item updates state',
      (WidgetTester tester) async {
    bool wasCalled = false;

    await tester.pumpWidget(baseComponentApp(
      CarPickerItems(
        items: testItems,
        selectedItem: selectedItem,
        onItemSelected: (String id) {
          wasCalled = true;
          selectedItem = id;
        },
      ),
    ));

    await tester.tap(find.text('Car 2'));
    await tester.pump();

    expect(wasCalled, isTrue);
    expect(selectedItem, '2');
  });

  testWidgets('Selecting the same item closes the dialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());

    await tester.tap(find.text('Car 1'));
    await tester.pump();

    verify(() => mockNavigatorObserver.didPop(any(), null)).called(1);
  });
}
