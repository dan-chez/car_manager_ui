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

import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_radio.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_item_data.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base/base_component_app.dart';

void main() {
  group('CMRadio Widget Tests', () {
    late CarPickerItemData testItem;

    setUp(() {
      testItem = const CarPickerItemData(
        id: '1',
        name: 'Batimovil No.1',
        plate: 'Plate:|34',
      );
    });

    testWidgets('Renders CMRadio correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          CarPickerRadio(
            item: testItem,
            groupValue: '1',
            onItemSelected: (_) {},
          ),
        ),
      );

      expect(find.text('Batimovil No.1'), findsOneWidget);
      expect(find.byIcon(Icons.circle), findsOneWidget);
    });

    testWidgets('Calls onItemSelected when tapped',
        (WidgetTester tester) async {
      String? selectedId;

      await tester.pumpWidget(
        baseComponentApp(
          CarPickerRadio(
            item: testItem,
            groupValue: null,
            onItemSelected: (id) => selectedId = id,
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(selectedId, equals('1'));
    });

    testWidgets('Changes icon color when selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          CarPickerRadio(
            item: testItem,
            groupValue: '1',
            onItemSelected: (_) {},
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.circle));
      expect(iconWidget.color, kAmaranthPrimary);
    });

    testWidgets('Shows unselected state when not selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          CarPickerRadio(
            item: testItem,
            groupValue: 'other_car',
            onItemSelected: (_) {},
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.circle));
      expect(iconWidget.color, kRadioBg);
    });
  });
}
