import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Creates a text field title widget with a specified title and optional size adjustment.
///
/// This function returns a [Column] widget containing a [Text] widget for the title,
/// with customizable styling based on the [higherSize] parameter. If [higherSize] is true,
/// the font size is set to 18, otherwise, it defaults to 12. The function also includes
/// spacing using [SizedBox] to ensure proper layout and separation.
///
/// [title] - The text to display as the title.
/// [higherSize] - A boolean flag to adjust the font size and spacing. Defaults to false.
Widget createTextFieldTitle(String title, {bool higherSize = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      Text(
        title,
        style: kMediumTitleTextStyle.copyWith(fontSize: higherSize ? 18 : 12),
      ),
      SizedBox(height: higherSize ? 0 : 16),
    ],
  );
}

/// Prints the provided value to the console in debug mode.
void printValue(String value) {
  if (kDebugMode) {
    print(value);
  }
}
