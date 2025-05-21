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
import 'package:carmanager_ui/src/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  group('SelectableServiceType Widget Tests', () {
    late List<SelectableServiceTypeItem> items;

    setUp(() {
      items = [
        SelectableServiceTypeItem(
          id: '1',
          icon: 'assets/car.svg',
          title: 'Car',
          description: 'Personal service',
        ),
        SelectableServiceTypeItem(
          id: '2',
          icon: 'assets/bike.svg',
          title: 'Bike',
          description: 'Transports people or goods for a fee.',
        ),
      ];
    });

    testWidgets('Renders all service type items', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (_) {},
          ),
        ),
      );

      expect(find.text('Car'), findsOneWidget);
      expect(find.text('Bike'), findsOneWidget);

      expect(find.text('Personal service${StringConstants.lineBreak}'),
          findsOneWidget);
      expect(
          find.text(
              'Transports people or goods for a fee.${StringConstants.lineBreak}'),
          findsOneWidget);
    });

    testWidgets('Calls onSelected when an item is tapped',
        (WidgetTester tester) async {
      String? selectedId;

      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (id) => selectedId = id,
          ),
        ),
      );

      await tester.tap(find.text('Car'));
      await tester.pumpAndSettle();

      expect(selectedId, equals('1'));
    });

    testWidgets('Only one item can be selected at a time',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (_) {},
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

    testWidgets('Displays correct icon colors based on selection state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (_) {},
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsNWidgets(2));

      await tester.tap(find.text('Car'));
      await tester.pumpAndSettle();

      final SvgPicture firstIcon = tester.widget(find.byType(SvgPicture).first);
      expect(
          firstIcon.colorFilter,
          equals(ColorFilter.mode(
            kWhite,
            BlendMode.srcIn,
          )));
    });
    testWidgets(
        'Initially selects the item with the provided initialSelection ID',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (_) {},
            initialSelection: '2',
          ),
        ),
      );

      final carText = tester.widget<Text>(find.text('Car'));
      final bikeText = tester.widget<Text>(find.text('Bike'));

      expect(carText.style?.color, kMyrtleGreen);
      expect(bikeText.style?.color, kWhite);
    });

    testWidgets('Does not select any item if initialSelection is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (_) {},
            initialSelection: null,
          ),
        ),
      );

      final carText = tester.widget<Text>(find.text('Car'));
      final bikeText = tester.widget<Text>(find.text('Bike'));

      expect(carText.style?.color, kMyrtleGreen);
      expect(bikeText.style?.color, kMyrtleGreen);
    });

    testWidgets(
        'Does not select any item if initialSelection ID does not exist in items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseComponentApp(
          SelectableServiceType(
            items: items,
            onSelected: (_) {},
            initialSelection: '3',
          ),
        ),
      );

      final carText = tester.widget<Text>(find.text('Car'));
      final bikeText = tester.widget<Text>(find.text('Bike'));

      expect(carText.style?.color, kMyrtleGreen);
      expect(bikeText.style?.color, kMyrtleGreen);
    });
  });
}
