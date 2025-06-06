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
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('CMTextField displays initial value',
      (WidgetTester tester) async {
    const initialValue = 'Initial Text';
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter text',
          initialValue: initialValue,
          onTextChange: (text) {},
        ),
      ),
    );

    expect(find.text(initialValue), findsOneWidget);
  });

  testWidgets('CMTextField calls onTextChange on input',
      (WidgetTester tester) async {
    String? changedText;
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
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

  testWidgets('CMTextField shows error text when field is empty and required',
      (WidgetTester tester) async {
    const errorText = 'Field cannot be empty';
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter text',
          canBeEmpty: false,
          errorText: errorText,
          onTextChange: (text) {},
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '');
    await tester.pump(); // Rebuild widget to show error text

    expect(find.text(errorText), findsOneWidget);
  });

  testWidgets('CMTextField respects maxLength and shows counter',
      (WidgetTester tester) async {
    const maxLength = 4;
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter text',
          maxLength: maxLength,
          onTextChange: (text) {},
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Long input');
    await tester.pump();
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(find.text('4/4'), findsOneWidget);
    expect(textField.controller!.text.length, equals(maxLength));
  });

  testWidgets('CMTextField respects maxLength and showCounter is false',
      (WidgetTester tester) async {
    const maxLength = 4;
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter text',
          maxLength: maxLength,
          onTextChange: (text) {},
          showCounter: false,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Long input');
    await tester.pump();
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(find.text('4/4'), findsNothing);
    expect(textField.controller!.text.length, equals(maxLength));
  });

  testWidgets('CMTextField uses correct keyboard type',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter number',
          textInputType: TextInputType.number,
          onTextChange: (text) {},
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.keyboardType, TextInputType.number);
  });

  testWidgets('CMTextField initializes controller with initialValue',
      (WidgetTester tester) async {
    const initialValue = 'Custon initial Value';
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Hint',
          initialValue: initialValue,
          onTextChange: (text) {},
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.controller!.text, initialValue);
  });

  testWidgets('CMTextField applies inputFormatters for number input type',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter number',
          textInputType: TextInputType.number,
          onTextChange: (text) {},
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.inputFormatters, [FilteringTextInputFormatter.digitsOnly]);
  });

  testWidgets('CMTextField shows or hides error text based on _hasError',
      (WidgetTester tester) async {
    const errorText = 'Error occurred';
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Enter text',
          canBeEmpty: false,
          errorText: errorText,
          onTextChange: (text) {},
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '');
    await tester.pump(); // Trigger rebuild to show error text
    expect(find.text(errorText), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Valid input');
    await tester.pump(); // Trigger rebuild to hide error text
    expect(find.text(errorText), findsNothing);
  });

  testWidgets('CMTextField applies custom text styles',
      (WidgetTester tester) async {
    const testStyle = TextStyle(color: Colors.red);
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Hint',
          onTextChange: (text) {},
          style: testStyle,
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.style, testStyle);
  });

  testWidgets('CMTextField applies default styles if no custom style provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMTextField(
          hintText: 'Hint',
          onTextChange: (text) {},
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.style, kContentTextStyle);
  });
}
