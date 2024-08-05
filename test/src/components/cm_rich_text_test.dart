import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bold Positions Test', (WidgetTester tester) async {
    const testText = 'This text is bold|, this isn\'t,| this is';
    const boldPositions = [0, 2];

    final richText = const CMRichText(
      text: testText,
      boldPositions: boldPositions,
    )();

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: richText)));

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

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: richText)));

    final richTextWidget = tester.widget<RichText>(find.byType(RichText));
    expect(richTextWidget.textAlign, testAlign);
  });
}
