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

import 'package:carmanager_ui/src/components/cm_rich_text.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/string_constants.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The [CMEmptyList] class is designed to present a message with customizable
/// bold text positions and an image, commonly used to indicate an empty list state.
/// It integrates with [CMRichText] for text styling and supports the use of SVG images.
///
/// Example usage:
/// ```dart
/// final emptyState = CMEmptyList(
///   text: "No items|found",
///   boldPositions: [1],
///   imagePath: 'assets/empty.svg',
/// );
/// ```
class CMEmptyList extends StatelessWidget {
  final String text;
  final String textDivider;
  final List<int> boldPositions;
  final String? imagePath;

  const CMEmptyList({
    super.key,
    required this.text,
    required this.boldPositions,
    this.textDivider = StringConstants.textDivider,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final asset = imagePath ?? '';
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: imagePath != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: CMDimens.d20),
              child: SvgPicture.asset(asset, height: CMDimens.d80),
            ),
          ),
          CMRichText(
            text: text,
            boldPositions: boldPositions,
            textDivider: textDivider,
            textStyle: kSubtitleTextStyle,
            boldFontWeight: FontWeight.w700,
          )()
        ],
      ),
    );
  }
}
