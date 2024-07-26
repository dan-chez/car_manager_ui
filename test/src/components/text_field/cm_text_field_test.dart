import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_component_app.dart';

void main() {
  testWidgets('CMTextField displays initial value', (WidgetTester tester) async {
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

  testWidgets('CMTextField calls onTextChange on input', (WidgetTester tester) async {
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

  testWidgets('CMTextField shows error text when field is empty and required', (WidgetTester tester) async {
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

  testWidgets('CMTextField respects maxLength', (WidgetTester tester) async {
    const maxLength = 5;
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
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.controller!.text.length, lessThanOrEqualTo(maxLength));
  });

  testWidgets('CMTextField uses correct keyboard type', (WidgetTester tester) async {
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

  testWidgets('CMTextField initializes controller with initialValue', (WidgetTester tester) async {
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

  testWidgets('CMTextField applies inputFormatters for number input type', (WidgetTester tester) async {
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

  testWidgets('CMTextField shows or hides error text based on _hasError', (WidgetTester tester) async {
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

  testWidgets('CMTextField applies custom text styles', (WidgetTester tester) async {
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

  testWidgets('CMTextField applies default styles if no custom style provided', (WidgetTester tester) async {
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
