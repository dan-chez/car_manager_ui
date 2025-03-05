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
import 'package:carmanager_ui/src/constants/button_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final String? iconPath;
  final String title;
  final String description;
  final Function() onPressed;
  final bool isEnabled;

  const CMBriefCard({
    super.key,
    this.iconPath,
    required this.title,
    required this.description,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = isEnabled ? kAmaranthPrimary : kSilver;

    final asset = iconPath ?? '';

    return TextButton(
      style: kCMBriefCardButtonStyle,
      onPressed: isEnabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CMDimens.d21),
        child: Row(
          children: [
            Visibility(
              visible: iconPath != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: CMDimens.d20),
                child: SvgPicture.asset(
                  asset,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  width: CMDimens.d35,
                  height: CMDimens.d35,
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
                        ? kSubtitleTextStyle.copyWith(
                            fontWeight: FontWeight.w500)
                        : kSubtitleTextStyle.copyWith(
                            fontWeight: FontWeight.w500, color: kSilver),
                  ),
                  const SizedBox(height: CMDimens.d10),
                  Text(
                    description,
                    style: isEnabled
                        ? kCaptionTextStyle.copyWith(
                            fontWeight: FontWeight.w300)
                        : kCaptionTextStyle.copyWith(
                            fontWeight: FontWeight.w300, color: kSilver),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: CMDimens.d18,
                left: CMDimens.d25,
              ),
              child: isEnabled ? kArrowForwardIcon : kArrowForwardDisableIcon,
            ),
          ],
        ),
      ),
    );
  }
}
