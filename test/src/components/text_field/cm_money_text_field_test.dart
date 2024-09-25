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

import '../base/base_component_app.dart';

void main() {
  testWidgets('CMMoneyTextField displays initial value',
      (WidgetTester tester) async {
    const initialValue = '123456';
    await tester.pumpWidget(
      baseComponentApp(
        CMMoneyTextField(
          hintText: 'Enter amount',
          initialValue: initialValue,
          onTextChange: (text) {},
        ),
      ),
    );

    expect(find.text('\$ 123.456'), findsOneWidget);
  });

  testWidgets('CMMoneyTextField fires onTextChange callback',
      (WidgetTester tester) async {
    String updatedText = '';
    await tester.pumpWidget(
      baseComponentApp(
        CMMoneyTextField(
          hintText: 'Enter amount',
          initialValue: '1000',
          onTextChange: (text) {
            updatedText = text;
          },
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '500');
    expect(updatedText, '500');
  });

  testWidgets('CMMoneyTextField shows error message when hasError is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMoneyTextField(
          hintText: 'Enter amount',
          onTextChange: (text) {},
          errorText: 'Invalid amount',
          initialValue: '1000',
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(find.text('Invalid amount'), findsOneWidget);
  });

  testWidgets('CMMoneyTextField updates styling based on enabled state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMoneyTextField(
          hintText: 'Enter amount',
          onTextChange: (text) {},
          isEnabled: false,
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.enabled, false);
    expect(textField.style?.color, kDarkDisable);
  });
}
