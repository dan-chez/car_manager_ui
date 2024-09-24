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

import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [RichTextShowcase] class provides a visual representation of [CMRichText]
/// styles and functionalities within the application.
class RichTextShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/richText';

  const RichTextShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMRichText showcase',
      children: [
        createShowcaseTitle(
            'A `RichText` widget in Flutter is a widget that displays a string of text with multiple styles. It allows for complex text layouts with different styles, such as varying fonts, colors, and other text properties within the same block of text.'),
        const Divider(height: 12),
        const CMRichText(text: 'This text is bold|, this isn\'t,| this is', boldPositions: [0, 2])(),
        const Divider(height: 12),
        CMRichText(
          text: 'No part of the text is in bold but all text is red',
          boldPositions: [],
          textStyle: kMediumTitleTextStyle.copyWith(color: Colors.red),
        )(),
        const Divider(height: 12),
        const CMRichText(text: 'All text bold and end align|', boldPositions: [0], textAlign: TextAlign.end)(),
        const Divider(height: 12),
        CMRichText(
          text: 'Align start and italic',
          boldPositions: [],
          textAlign: TextAlign.start,
          textStyle: kMediumTitleTextStyle.copyWith(fontStyle: FontStyle.italic),
        )(),
        const Divider(height: 12),
        CMRichText(
          text: 'Underlined text',
          boldPositions: [0],
          textStyle: kMediumTitleTextStyle.copyWith(decoration: TextDecoration.underline),
        )(),
        const Divider(height: 12),
        const CMRichText(
          text: '    Leading spaces| and trailing spaces    and align start',
          boldPositions: [0],
          textStyle: kMediumTitleTextStyle,
          textAlign: TextAlign.start,
        )(),
        const Divider(height: 12),
        CMRichText(
          text: 'This is bold and blue|',
          boldPositions: [0],
          textStyle: kMediumTitleTextStyle.copyWith(color: Colors.blue),
        )(),
        const Divider(height: 12),
      ],
    );
  }
}
