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

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  group('SelectableVehicle Widget Tests', () {
    final items = [
      SelectableVehicleItem(id: '1', icon: 'assets/car.svg', description: 'Car'),
      SelectableVehicleItem(id: '2', icon: 'assets/bike.svg', description: 'Bike'),
      SelectableVehicleItem(id: '3', icon: 'assets/bus.svg', description: 'Bus'),
    ];

    testWidgets('Should display all vehicle items', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableVehicle(
            items: items,
            onSelected: (_) {},
          ),
        ),
      );

      for (final item in items) {
        expect(find.text(item.description), findsOneWidget);
      }
    });

    testWidgets('Should call onSelected callback with the correct ID', (WidgetTester tester) async {
      String? selectedId;
      await tester.pumpWidget(
        baseComponentApp(
          SelectableVehicle(
            items: items,
            onSelected: (id) => selectedId = id,
          ),
        ),
      );

      await tester.tap(find.text('Bus'));
      await tester.pumpAndSettle();

      expect(selectedId, equals('3'));
    });

    testWidgets('Should update the selectedId state when an item is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableVehicle(
            items: items,
            onSelected: (_) {},
          ),
        ),
      );

      await tester.tap(find.text('Bike'));
      await tester.pumpAndSettle();

      expect(find.text('Bike'), findsOneWidget);
    });

    testWidgets('Should display the selected item’s icon with the selected color', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableVehicle(
            items: items,
            onSelected: (_) {},
          ),
        ),
      );

      await tester.tap(find.text('Bus'));
      await tester.pumpAndSettle();

      final iconWidget = tester.widget<SvgPicture>(find.byType(SvgPicture).last);
      final colorFilter = iconWidget.colorFilter as ColorFilter;
      expect(
          colorFilter,
          equals(ColorFilter.mode(
            kWhite,
            BlendMode.srcIn,
          )));
    });

    testWidgets('Should apply ellipsis overflow to text if it exceeds the width', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SelectableVehicle(
              items: [
                SelectableVehicleItem(
                  id: '1',
                  icon: 'assets/car.svg',
                  description: 'This is a very long vehicle description that should be truncated',
                ),
              ],
              onSelected: (_) {},
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));

      expect(textWidget.overflow, equals(TextOverflow.ellipsis));
    });

    testWidgets('Should only have one selected item at a time', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SelectableVehicle(
              items: items,
              onSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('Car'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Bike'));
      await tester.pumpAndSettle();

      final carWidget = tester.widget<Text>(find.text('Car'));
      final bikeWidget = tester.widget<Text>(find.text('Bike'));

      expect(carWidget.style?.color, kMyrtleGreen);
      expect(bikeWidget.style?.color, kWhite);
    });
  });
}
