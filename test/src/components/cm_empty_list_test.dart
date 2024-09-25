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

import 'package:carmanager_ui/src/components/cm_empty_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('CMEmptyList displays text with bold positions correctly',
      (WidgetTester tester) async {
    // Define the test data
    const testText = 'Your garage is|empty';
    const testBoldPositions = [1];

    // Build the CMEmptyList widget
    await tester.pumpWidget(
      baseComponentApp(
        const CMEmptyList(
          text: testText,
          boldPositions: testBoldPositions,
          imagePath: null,
        ),
      ),
    );

    // Verify the RichText widget is displayed
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsOneWidget);

    // Get the RichText widget and extract its TextSpan
    final RichText richTextWidget = tester.widget(richTextFinder);
    final TextSpan textSpan = richTextWidget.text as TextSpan;

    // Extract the text and styles from TextSpan
    final String plainText = textSpan.toPlainText();
    final List<InlineSpan> spans = textSpan.children!;

    // Verify the full text is correct
    expect(plainText.trim(), equals('Your garage is empty'));

    // Verify that the word 'empty' is bold
    final TextSpan emptyTextSpan =
        spans[1] as TextSpan; // The second part of the split text
    expect(emptyTextSpan.text.toString().trim(), equals('empty'));
    expect(emptyTextSpan.style!.fontWeight,
        equals(FontWeight.w700)); // Verifying the bold fontWeight
  });

  testWidgets('CMEmptyList uses textDivider correctly',
      (WidgetTester tester) async {
    // Define the test data
    const testText = 'No vehicles+found+here';
    const testBoldPositions = [1];
    const testTextDivider = '+';

    // Build the CMEmptyList widget
    await tester.pumpWidget(baseComponentApp(
      const CMEmptyList(
        text: testText,
        boldPositions: testBoldPositions,
        textDivider: testTextDivider,
      ),
    ));

    // Verify the RichText widget is displayed
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsOneWidget);

    // Get the RichText widget and extract its TextSpan
    final RichText richTextWidget = tester.widget(richTextFinder);
    final TextSpan textSpan = richTextWidget.text as TextSpan;

    // Extract the text and styles from TextSpan
    final String plainText = textSpan.toPlainText();
    final List<InlineSpan> spans = textSpan.children!;

    // Verify the full text is correct
    expect(plainText.trim(), equals('No vehicles found here'));

    // Verify that the word 'found' is bold
    final TextSpan emptyTextSpan = spans[1] as TextSpan;
    expect(emptyTextSpan.text.toString().trim(), equals('found'));
    expect(emptyTextSpan.style!.fontWeight, equals(FontWeight.w700));
  });

  testWidgets('CMEmptyList does not display asset image when imagePath is null',
      (WidgetTester tester) async {
    const testText = 'Your garage is|empty';
    const testBoldPositions = [1];

    // Define the test data with a null image path
    await tester.pumpWidget(baseComponentApp(
      const CMEmptyList(
        text: testText,
        boldPositions: testBoldPositions,
        imagePath: null, // No image path provided
      ),
    ));

    // Verify that the asset (SvgPicture) is not displayed
    expect(find.byType(SvgPicture), findsNothing);
  });
}
