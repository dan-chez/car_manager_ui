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
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

/// The [CMSelectableCard] widget displays a card with a leading icon, a primary title,
/// an optional subtitle with rich text support, and a trailing arrow icon.
///
/// Example usage:
/// ```dart
/// CMSelectableCard(
///   leadingIcon: kCheckIconRed,
///   title: 'Chevrolet Spark GT',
///   subtitleBoldPositions: [1],
///   floatingLabel: 'Current vehicle',
///   subtitle: 'Plate:|ABC123',
///   titleUpperCase: false,
///   onPressed: () {
///     // Handle tap event
///   },
/// );
/// ```
class CMSelectableCard extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final bool titleUpperCase;
  final String? subtitle;
  final List<int> subtitleBoldPositions;
  final VoidCallback onPressed;
  final String? floatingLabel;

  const CMSelectableCard({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.titleUpperCase = true,
    this.subtitle,
    this.subtitleBoldPositions = const [],
    required this.onPressed,
    this.floatingLabel,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasFloatingLabel =
        floatingLabel != null && floatingLabel!.trim().isNotEmpty;
    final bool hasSubtitle = subtitle != null && subtitle!.trim().isNotEmpty;

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
              CMDimens.d10,
              CMDimens.d14,
              CMDimens.d16,
              CMDimens.d10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CMDimens.d2),
              color: kWhite,
              border: Border.all(
                color: kGreyDisable.withValues(alpha: 0.1),
              ),
              boxShadow: const [
                BoxShadow(
                  color: kBoxShadowColor,
                  offset: Offset(CMDimens.d0, CMDimens.d3),
                  blurRadius: CMDimens.d3,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      leadingIcon,
                      const SizedBox(width: CMDimens.d8),
                      Flexible(
                        child: Text(
                          titleUpperCase ? title.toUpperCase() : title,
                          style: kContentTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                if (hasSubtitle) ...[
                  const SizedBox(width: CMDimens.d7),
                  Expanded(
                    child: CMRichText(
                      text: subtitle!,
                      boldPositions: subtitleBoldPositions,
                      maxLines: 1,
                      textStyle:
                          kCaptionTextStyle.copyWith(color: kGreyDisable),
                      textAlign: TextAlign.start,
                    )(),
                  ),
                ],
                const SizedBox(width: CMDimens.d7),
                kArrowForwardIcon,
              ],
            ),
          ),
          Visibility(
            visible: hasFloatingLabel,
            child: Positioned(
              left: CMDimens.d12,
              top: -CMDimens.d9,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: CMDimens.d4),
                color: kWhite,
                child: Text(
                  floatingLabel ?? '',
                  style: kCaptionTextStyle.copyWith(
                    color: kSilver,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
