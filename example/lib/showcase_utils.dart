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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Creates a showcase title widget with a specified title and optional size adjustment.
///
/// This function returns a [Column] widget containing a [Text] widget for the title,
/// with customizable styling based on the [higherSize] parameter. If [higherSize] is true,
/// the font size is set to 18, otherwise, it defaults to 12. The function also includes
/// spacing using [SizedBox] to ensure proper layout and separation.
///
/// [title] - The text to display as the title.
/// [higherSize] - A boolean flag to adjust the font size and spacing. Defaults to false.
Widget createShowcaseTitle(String title, {bool higherSize = false}) {
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

/// This function ensures that any currently visible SnackBar is removed before displaying a new one
void showCustomSnackBar(BuildContext context, SnackBar snackBar) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
