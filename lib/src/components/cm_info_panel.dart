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

import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/decoration_constants.dart';
import 'package:carmanager_ui/src/components/cm_rich_text.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:flutter/material.dart';

/// The [CMInfoPanel] widget displays an informational message with an optional leading icon.
/// It's commonly used to highlight important information, tips, or warnings to the user.
///
/// Example usage:
/// ```dart
/// CMInfoPanel(
///   content: 'This is an|important message|with bold words',
///   boldPositions: [1], // Makes 'important message' bold
///   maxLines: 2,
///   icon: Icon(Icons.warning, color: Colors.orange),
/// )
/// ```
class CMInfoPanel extends StatelessWidget {
  const CMInfoPanel({
    super.key,
    this.icon = kInfoIcon,
    this.boldPositions = const [],
    this.maxLines = 1,
    required this.content,
  });

  final Widget icon;
  final List<int> boldPositions;
  final int maxLines;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationWithWhitBG,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          CMDimens.d14,
          CMDimens.d13,
          CMDimens.d23,
          CMDimens.d14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CMDimens.d6),
          color: kPrimaryColorWithOpacityBG,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(width: CMDimens.d9),
            Flexible(
              child: CMRichText(
                text: content,
                textStyle: kCaptionTextStyle.copyWith(color: kkMyrtleGreenWithOpacity),
                boldFontWeight: FontWeight.w700,
                contentFontWeight: FontWeight.w400,
                boldPositions: boldPositions,
                maxLines: maxLines,
                textAlign: TextAlign.start,
              )(),
            ),
          ],
        ),
      ),
    );
  }
}
