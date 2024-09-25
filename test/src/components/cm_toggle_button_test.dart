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

import 'package:carmanager_ui/src/components/cm_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('Should render toggle button with correct labels',
      (WidgetTester tester) async {
    const labels = ['Option 1', 'Option 2'];

    await tester.pumpWidget(baseComponentApp(
      CMToggleButton(
        labels: labels,
        onChanged: (_) {},
      ),
    ));

    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('Should call onChanged when a toggle is pressed',
      (WidgetTester tester) async {
    int selectedIndex = -1;
    const labels = ['Yes', 'No'];

    await tester.pumpWidget(baseComponentApp(
      CMToggleButton(
        labels: labels,
        onChanged: (index) {
          selectedIndex = index;
        },
      ),
    ));

    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
  });

  testWidgets('Can set active background colors', (WidgetTester tester) async {
    const activeColor = Colors.red;
    const labels = ['On', 'Off'];

    await tester.pumpWidget(
      baseComponentApp(
        CMToggleButton(
          labels: labels,
          activeBgColor: activeColor,
          onChanged: (_) {},
        ),
      ),
    );

    final toggleButton = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));

    for (final color in toggleButton.activeBgColors ?? <Color>[]) {
      expect(color, [activeColor]);
    }
  });
}
