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
  testWidgets('CMMultilineTextField renders with default values',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Hint Text',
          onTextChange: (text) {},
        ),
      ),
    );

    expect(find.byType(CMMultilineTextField), findsOneWidget);
    expect(find.text('Hint Text'), findsOneWidget);
  });

  testWidgets('CMMultilineTextField updates text and calls onTextChange',
      (WidgetTester tester) async {
    String changedText = '';
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Enter text',
          onTextChange: (text) {
            changedText = text;
          },
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'New Text');
    expect(changedText, 'New Text');
  });

  testWidgets('CMMultilineTextField shows error when canBeEmpty is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Enter text',
          canBeEmpty: false,
          errorText: 'This field cannot be empty',
          onTextChange: (text) {},
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '');
    await tester.pump(); // Trigger rebuild to show error text

    expect(find.text('This field cannot be empty'), findsOneWidget);
  });

  testWidgets('CMMultilineTextField applies custom text style',
      (WidgetTester tester) async {
    const testStyle = TextStyle(color: Colors.red);
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Hint Text',
          onTextChange: (text) {},
          style: testStyle,
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.style, testStyle);
  });

  testWidgets('CMMultilineTextField respects maxLength',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Enter text',
          onTextChange: (text) {},
          maxLength: 10,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Very long input');
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.controller?.text.length, 10);
  });

  testWidgets('CMMultilineTextField is disabled when isEnabled is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Enter text',
          isEnabled: false,
          onTextChange: (text) {},
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.enabled, isFalse);
  });

  testWidgets('CMMultilineTextField handles null initialValue gracefully',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMMultilineTextField(
          hintText: 'Enter text',
          onTextChange: (text) {},
          initialValue: null,
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.controller?.text, '');
  });
}
