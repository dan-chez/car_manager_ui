// Copyright 2024 Danchez
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/cm_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../base/base_component_app.dart';

void main() {
  Finder findDetailsRichTexts() {
    return find.byWidgetPredicate((widget) {
      if (widget is RichText) {
        final plainText = (widget.text as TextSpan).toPlainText();
        return plainText.contains('EV2024') ||
            plainText.contains('15.000') ||
            plainText.contains('Electric Vehicle') ||
            plainText.contains('MUSCLE99') ||
            plainText.contains('80.000') ||
            plainText.contains('Classic Muscle Car') ||
            plainText.contains('BUG123') ||
            plainText.contains('10.000') ||
            plainText.contains('Hypercar');
      }
      return false;
    });
  }

  testWidgets('Should render VehicleInfoCard correctly (Non-Selectable)', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const VehicleInfoCard(
          type: VehicleInfoCardType.fixed,
          name: 'Tesla Model S',
          plate: 'Plate:|EV2024',
          kms: '15.000|KM',
          vehicleType: 'Electric Vehicle',
        ),
      ),
    );

    expect(find.text('TESLA MODEL S', skipOffstage: true), findsOneWidget);

    final details = tester.widgetList<RichText>(findDetailsRichTexts()).toList();
    expect(details.length, 3);

    expect(find.byType(CMSwitch), findsNothing);
  });

  testWidgets('Should render VehicleInfoCard with toggle (Selectable)', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        VehicleInfoCard(
          type: VehicleInfoCardType.toggleable,
          name: 'Lamborghini Aventador',
          plate: 'Plate:|XYZ789',
          kms: '50.000|KM',
          vehicleType: 'Luxury Sports Car',
        ),
      ),
    );

    expect(find.text('LAMBORGHINI AVENTADOR', skipOffstage: true), findsOneWidget);
    expect(find.byType(CMSwitch), findsOneWidget);
  });

  testWidgets('Should call onEditPressed when edit button is tapped', (WidgetTester tester) async {
    bool editPressed = false;

    await tester.pumpWidget(
      baseComponentApp(
        VehicleInfoCard(
          type: VehicleInfoCardType.fixed,
          name: 'Mercedes Sprinter',
          plate: 'Plate:|FLEET001',
          kms: '30.000|KM',
          vehicleType: 'Commercial Van',
          onEditPressed: () {
            editPressed = true;
          },
        ),
      ),
    );

    final editButton = find.byWidget(kEditSquareIcon);
    await tester.tap(editButton);
    await tester.pump();

    expect(editPressed, isTrue);
  });

  testWidgets('Should call onDeletePressed when delete button is tapped', (WidgetTester tester) async {
    bool deletePressed = false;

    await tester.pumpWidget(
      baseComponentApp(
        VehicleInfoCard(
          type: VehicleInfoCardType.fixed,
          name: 'Mercedes Sprinter',
          plate: 'Plate:|FLEET001',
          kms: '30.000|KM',
          vehicleType: 'Commercial Van',
          onDeletePressed: () {
            deletePressed = true;
          },
        ),
      ),
    );

    final deleteButton = find.byWidget(kDeleteIcon);
    await tester.tap(deleteButton);
    await tester.pump();

    expect(deletePressed, isTrue);
  });

  testWidgets('Should animate details visibility transition', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        VehicleInfoCard(
          type: VehicleInfoCardType.toggleable,
          name: 'Ford Mustang',
          plate: 'Plate:|MUSCLE99',
          kms: '80.000|KM',
          vehicleType: 'Classic Muscle Car',
        ),
      ),
    );

    final switchFinder = find.byType(CMSwitch);
    await tester.tap(switchFinder);
    await tester.pump();

    expect(tester.binding.hasScheduledFrame, isTrue);

    await tester.pumpAndSettle();
    expect(tester.binding.hasScheduledFrame, isFalse);
  });

  testWidgets('Should render CMRichText correctly with bold positions', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const VehicleInfoCard(
          type: VehicleInfoCardType.fixed,
          name: 'Bugatti Chiron',
          plate: 'Plate:|BUG123',
          kms: '10.000|KM',
          vehicleType: 'Hypercar',
        ),
      ),
    );

    final richTexts = tester.widgetList<RichText>(findDetailsRichTexts()).toList();
    expect(richTexts.length, 3);

    final plateRichText = richTexts.firstWhere((rt) {
      final plain = (rt.text as TextSpan).toPlainText();
      return plain.contains('BUG123');
    });
    final plateSpans = (plateRichText.text as TextSpan).children!;
    expect((plateSpans[1] as TextSpan).style!.fontWeight, FontWeight.w600);

    final kmsRichText = richTexts.firstWhere((rt) {
      final plain = (rt.text as TextSpan).toPlainText();
      return plain.contains('10.000');
    });
    final kmsSpans = (kmsRichText.text as TextSpan).children!;
    expect((kmsSpans[0] as TextSpan).style!.fontWeight, FontWeight.w600);
  });
}
