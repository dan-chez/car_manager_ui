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

import 'package:carmanager_ui/src/components/cm_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  const initialState = false;

  testWidgets('Should render CMSwitch correctly', (WidgetTester tester) async {
    bool switchValue = initialState;

    await tester.pumpWidget(baseComponentApp(
      CMSwitch(
        initialValue: switchValue,
        onChanged: (value) => switchValue = value,
      ),
    ));

    expect(find.byType(CMSwitch), findsOneWidget);
  });

  testWidgets('Should toggle switch state when tapped',
      (WidgetTester tester) async {
    bool switchValue = initialState;

    await tester.pumpWidget(baseComponentApp(
      CMSwitch(
        initialValue: switchValue,
        onChanged: (value) => switchValue = value,
      ),
    ));

    final switchFinder = find.byType(InkWell);

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(switchValue, true);

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(switchValue, false);
  });

  testWidgets('Should call onChanged callback when tapped',
      (WidgetTester tester) async {
    bool switchValue = initialState;
    bool callbackCalled = false;

    await tester.pumpWidget(baseComponentApp(
      CMSwitch(
        initialValue: switchValue,
        onChanged: (value) {
          callbackCalled = true;
        },
      ),
    ));

    final switchFinder = find.byType(InkWell);

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(callbackCalled, true);
  });

  testWidgets('Should animate smoothly when toggled',
      (WidgetTester tester) async {
    bool switchValue = initialState;

    await tester.pumpWidget(baseComponentApp(
      CMSwitch(
        initialValue: switchValue,
        onChanged: (value) => switchValue = value,
      ),
    ));

    final switchFinder = find.byType(InkWell);

    await tester.tap(switchFinder);
    await tester.pump();

    expect(tester.binding.hasScheduledFrame, isTrue);

    await tester.pumpAndSettle();
    expect(tester.binding.hasScheduledFrame, isFalse);
  });
}
