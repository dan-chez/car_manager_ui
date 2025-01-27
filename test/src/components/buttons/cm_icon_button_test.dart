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

import 'package:carmanager_ui/src/components/buttons/cm_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Displays the provided icon', (WidgetTester tester) async {
    const testIcon = Icons.add;

    await tester.pumpWidget(
      baseComponentApp(
        const CMIconButton(
          icon: Icon(testIcon),
          onPressed: null,
        ),
      ),
    );

    expect(find.byIcon(testIcon), findsOneWidget);
  });

  testWidgets('Triggers onPressed callback when tapped',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      baseComponentApp(
        CMIconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            wasPressed = true;
          },
        ),
      ),
    );

    await tester.tap(find.byType(CMIconButton));
    await tester.pumpAndSettle();

    expect(wasPressed, isTrue);
  });
}
