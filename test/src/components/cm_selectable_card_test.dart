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
  testWidgets('CMSelectableCard onPressed callback',
      (WidgetTester tester) async {
    bool wasPressed = false;
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      subtitle: 'Plate:|ABC123',
      subtitleBoldPositions: const [1],
      onPressed: () {
        wasPressed = true;
      },
    );

    await tester.pumpWidget(baseComponentApp(card));
    await tester.tap(find.byType(CMSelectableCard));
    await tester.pump();

    expect(wasPressed, isTrue);
  });

  testWidgets('CMSelectableCard displays uppercase title by default',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'chevrolet spark gt',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.text('CHEVROLET SPARK GT'), findsOneWidget);
  });

  testWidgets('CMSelectableCard displays title without uppercase when disabled',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      titleUpperCase: false,
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.text('Chevrolet Spark GT'), findsOneWidget);
    expect(find.text('CHEVROLET SPARK GT'), findsNothing);
  });

  testWidgets('CMSelectableCard displays subtitle correctly',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      subtitle: 'Plate:|ABC123',
      subtitleBoldPositions: const [1],
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    final richTextSubtitle = find.byWidgetPredicate((widget) {
      if (widget is RichText) {
        final plainText = widget.text.toPlainText();
        return plainText.contains('Plate: ABC123');
      }
      return false;
    });

    expect(richTextSubtitle, findsOneWidget);
  });

  testWidgets('CMSelectableCard does not display subtitle when null',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    final richTextSubtitle = find.byWidgetPredicate((widget) {
      if (widget is RichText) {
        final plainText = widget.text.toPlainText();
        return plainText.contains('Plate:');
      }
      return false;
    });

    expect(richTextSubtitle, findsNothing);
  });

  testWidgets('CMSelectableCard displays leading icon and arrow icon',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.byWidget(kCheckIconRed), findsOneWidget);
    expect(find.byWidget(kArrowForwardIcon), findsOneWidget);
  });

  testWidgets('CMSelectableCard displays custom leading icon',
      (WidgetTester tester) async {
    const customIcon = Icon(Icons.directions_car, color: Colors.blue);
    final card = CMSelectableCard(
      leadingIcon: customIcon,
      title: 'Honda Civic',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.byIcon(Icons.directions_car), findsOneWidget);
    expect(find.byWidget(kArrowForwardIcon), findsOneWidget);
  });

  testWidgets('CMSelectableCard displays floating label when provided',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      floatingLabel: 'Current vehicle',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.text('Current vehicle'), findsOneWidget);
  });

  testWidgets('CMSelectableCard does not display floating label when null',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    expect(find.text('Current vehicle'), findsNothing);
  });

  testWidgets('CMSelectableCard does not display floating label when empty',
      (WidgetTester tester) async {
    final card = CMSelectableCard(
      leadingIcon: kCheckIconRed,
      title: 'Chevrolet Spark GT',
      floatingLabel: '   ',
      onPressed: () {},
    );

    await tester.pumpWidget(baseComponentApp(card));

    final visibilityFinder = find.byWidgetPredicate((widget) {
      if (widget is Visibility) {
        return widget.visible == false;
      }
      return false;
    });

    expect(visibilityFinder, findsOneWidget);
  });
}
