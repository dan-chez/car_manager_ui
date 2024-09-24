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
  testWidgets('Bold Positions Test', (WidgetTester tester) async {
    const testText = 'This text is bold|, this isn\'t,| this is';
    const boldPositions = [0, 2];

    final richText = const CMRichText(
      text: testText,
      boldPositions: boldPositions,
    )();

    await tester.pumpWidget(baseComponentApp(richText));

    final richTextWidget = tester.widget<RichText>(find.byType(RichText));
    final textSpans = richTextWidget.text as TextSpan;

    expect(textSpans.children![0].style!.fontWeight, FontWeight.w600);
    expect(textSpans.children![1].style!.fontWeight, FontWeight.w300);
    expect(textSpans.children![2].style!.fontWeight, FontWeight.w600);
  });

  testWidgets('Text Alignment Test', (WidgetTester tester) async {
    const testText = 'This text is bold|, this isn\'t,| this is';
    const boldPositions = [0, 2];
    const testAlign = TextAlign.right;

    final richText = const CMRichText(
      text: testText,
      boldPositions: boldPositions,
      textAlign: testAlign,
    ).call();

    await tester.pumpWidget(baseComponentApp(richText));

    final richTextWidget = tester.widget<RichText>(find.byType(RichText));
    expect(richTextWidget.textAlign, testAlign);
  });
}
