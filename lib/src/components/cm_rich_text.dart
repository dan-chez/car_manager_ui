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

import 'package:carmanager_ui/src/constants/string_constants.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
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
  final int? maxLines;

  const CMRichText({
    required this.text,
    required this.boldPositions,
    this.textDivider = StringConstants.textDivider,
    this.textStyle = kMediumTitleTextStyle,
    this.textAlign = TextAlign.center,
    this.boldFontWeight = FontWeight.w600,
    this.contentFontWeight = FontWeight.w300,
    this.maxLines,
  });

  RichText call() {
    // Ensure boldPositions is within valid range
    assert(
        boldPositions
            .every((pos) => pos >= 0 && pos < text.split(textDivider).length),
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
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
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
