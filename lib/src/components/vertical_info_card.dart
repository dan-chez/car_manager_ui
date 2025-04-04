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
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

/// The [VerticalInfoCard] widget displays a card with a vertical layout featuring a [textValue]
/// and a [textDescription]. The card is styled with a shadow and rounded corners, and it adjusts
/// to the full width of its container.
///
/// Example usage:
/// ```dart
/// VerticalInfoCard(
///   textValue: '100',
///   textDescription: 'Total Items',
/// )
/// ```
class VerticalInfoCard extends StatelessWidget {
  final String textValue;
  final String textDescription;

  const VerticalInfoCard({
    super.key,
    required this.textValue,
    required this.textDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: kBoxShadowColor,
              blurRadius: CMDimens.d4,
              offset: Offset(CMDimens.d0, CMDimens.d5),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(CMDimens.d6))),
      child: Container(
        decoration: const BoxDecoration(
            color: kPrimaryColorWithOpacityBG,
            borderRadius: BorderRadius.all(Radius.circular(CMDimens.d6))),
        child: Padding(
          padding: const EdgeInsets.only(
            right: CMDimens.d12,
            top: CMDimens.d20,
            left: CMDimens.d12,
            bottom: CMDimens.d15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  textValue,
                  style: kTitleTextStyle.copyWith(
                    color: kkMyrtleGreenWithOpacity,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  textDescription,
                  style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    color: kkMyrtleGreenWithOpacity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
