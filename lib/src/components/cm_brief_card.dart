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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/button_constants.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';

/// The [CMBriefCard] widget is used to display a brief, actionable card with an optional SVG icon,
/// a title, and a description. It is commonly used to present succinct information paired
/// with an action button in various UI scenarios. The card can be enabled or disabled,
/// and when disabled, the text and icon will appear in a muted color.
///
/// Example usage:
/// ```dart
/// final card = CMBriefCard(
///   cardIcon: 'assets/icons/sample_icon.svg',
///   title: 'Card Title',
///   description: 'This is a brief description of the card.',
///   onPressed: () {
///     print('Card pressed');
///   },
/// );
/// ```
class CMBriefCard extends StatelessWidget {
  //This string should contain the svg image path
  final String? cardIcon;
  final String title;
  final String description;
  final Function() onPressed;
  final bool isEnabled;

  const CMBriefCard({
    super.key,
    this.cardIcon,
    required this.title,
    required this.description,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = isEnabled ? kAmaranthPrimary : kSilver;

    final asset = cardIcon ?? '';

    return TextButton(
      style: kCMBriefCardButtonStyle,
      onPressed: isEnabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 21),
        child: Row(
          children: [
            Visibility(
              visible: cardIcon != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  asset,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: isEnabled
                        ? kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w500)
                        : kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w500, color: kSilver),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: isEnabled
                        ? kCaptionTextStyle.copyWith(fontWeight: FontWeight.w300)
                        : kCaptionTextStyle.copyWith(fontWeight: FontWeight.w300, color: kSilver),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18, left: 25),
              child: isEnabled ? kArrowForwardIcon : kArrowForwardDisableIcon,
            ),
          ],
        ),
      ),
    );
  }
}
