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
import 'package:flutter/material.dart' show Icons, TextButton;
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('PrimaryButton shows the correct text', (WidgetTester tester) async {
    const labelText = 'Click Me';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          txtLabel: labelText,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text(labelText), findsOneWidget);
  });

  testWidgets('PrimaryButton is disabled when isEnabled is false', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          isEnabled: false,
          txtLabel: 'Disabled Button',
          onPressed: () {},
        ),
      ),
    );

    final button = tester.widget<TextButton>(find.byType(TextButton));
    expect(button.enabled, isFalse);
  });

  testWidgets('PrimaryButton shows loader when isLoading is true', (WidgetTester tester) async {
    const labelText = 'Loading Button';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          isLoading: true,
          txtLabel: labelText,
          onPressed: () {},
        ),
      ),
    );

    expect(find.byType(Loader), findsOneWidget);
    expect(find.text(labelText), findsNothing);
  });

  testWidgets('PrimaryButton displays icon when provided', (WidgetTester tester) async {
    const labelText = 'Button with Icon';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          txtLabel: labelText,
          onPressed: () {},
          icon: kAddExpenseIconWhite,
        ),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text(labelText), findsOneWidget);
  });

  testWidgets('PrimaryButton calls onPressed when tapped', (WidgetTester tester) async {
    bool wasPressed = false;
    const labelText = 'Click Me';
    await tester.pumpWidget(
      baseComponentApp(
        PrimaryButton(
          txtLabel: labelText,
          onPressed: () {
            wasPressed = true;
          },
        ),
      ),
    );

    await tester.tap(find.text(labelText));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
