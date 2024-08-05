import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// A factory class for creating rich text widgets with customizable styles.
///
/// The [CMRichText] class facilitates the creation of rich text by splitting a
/// provided [text] string using a [textDivider] and applying different font weights
/// to specified portions. The class supports configuration of text alignment,
/// default text style, and specific font weights for bold and regular text.
///
/// Example usage:
/// ```dart
/// final richText = RichTextFactory(
///   text: "Hello|World",
///   boldPositions: [1],
/// );
/// ```
class CMRichText {
  final String text;
  final List<int> boldPositions;
  final String textDivider;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final FontWeight boldFontWeight;
  final FontWeight contentFontWeight;

  const CMRichText({
    required this.text,
    required this.boldPositions,
    this.textDivider = '|',
    this.textStyle = kMediumTitleTextStyle,
    this.textAlign = TextAlign.center,
    this.boldFontWeight = FontWeight.w600,
    this.contentFontWeight = FontWeight.w300,
  });

  RichText call() {
    // Ensure boldPositions is within valid range
    assert(boldPositions.every((pos) => pos >= 0 && pos < text.split(textDivider).length),
        'All boldPositions must be valid indices within the split text.');

    // Split the text based on the divider
    List<String> splitText = text.split(textDivider);
    // List to hold the TextSpan widgets
    List<TextSpan> textSpans = splitText.asMap().entries.map((entry) {
      int index = entry.key;
      String part = entry.value;
      return _createTextSpan(part, boldPositions.contains(index));
    }).toList();

    // Return the RichText widget with all TextSpan children
    return RichText(
      textAlign: textAlign,
      text: TextSpan(children: textSpans),
    );
  }

  /// Helper method to create a [TextSpan] with appropriate styling.
  TextSpan _createTextSpan(String text, bool isBold) {
    return TextSpan(
      text: '$text ',
      style: textStyle.copyWith(
        fontWeight: isBold ? boldFontWeight : contentFontWeight,
      ),
    );
  }
}
