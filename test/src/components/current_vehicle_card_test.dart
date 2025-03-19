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
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('CurrentVehicleCard onPressed callback', (WidgetTester tester) async {
    bool wasPressed = false;
    final card = CurrentVehicleCard(
      vehicleName: 'Chevrolet Spark GT',
      vehiclePlate: 'Plate:|ABC123',
      plateBoldPositions: [1],
      onPressed: () {
        wasPressed = true;
      },
    );

    await tester.pumpWidget(baseComponentApp(card));
    await tester.tap(find.byType(CurrentVehicleCard));
    await tester.pump();

    expect(wasPressed, isTrue);
  });

  testWidgets('CurrentVehicleCard displays uppercase vehicle name', (WidgetTester tester) async {
    final card = CurrentVehicleCard(
      vehicleName: 'chevrolet spark gt',
      vehiclePlate: 'Plate:|ABC123',
      plateBoldPositions: [1],
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.text('CHEVROLET SPARK GT'), findsOneWidget);
  });

  testWidgets('CurrentVehicleCard displays vehicle plate correctly', (WidgetTester tester) async {
    final card = CurrentVehicleCard(
      vehicleName: 'Chevrolet Spark GT',
      vehiclePlate: 'Plate:|ABC123',
      plateBoldPositions: [1],
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    final richTextPlate = find.byWidgetPredicate((widget) {
      if (widget is RichText) {
        final plainText = widget.text.toPlainText();
        return plainText.contains('Plate: ABC123');
      }
      return false;
    });

    expect(richTextPlate, findsOneWidget);
  });

  testWidgets('CurrentVehicleCard displays check and arrow icons', (WidgetTester tester) async {
    final card = CurrentVehicleCard(
      vehicleName: 'Chevrolet Spark GT',
      vehiclePlate: 'Plate:|ABC123',
      plateBoldPositions: [1],
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.byWidget(kCheckIconRed), findsOneWidget);
    expect(find.byWidget(kArrowForwardIcon), findsOneWidget);
  });
}
