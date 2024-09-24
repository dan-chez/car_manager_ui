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
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

/// The [HorizontalInfoCard] widget displays a card with a horizontal layout featuring a [textValue]
/// and a [textDescription]. The card is styled with a shadow and rounded corners, and it adjusts
/// to the full width of its container.
///
/// Example usage:
/// ```dart
/// HorizontalInfoCard(
///   textValue: '1000',
///   textDescription: 'Description',
/// )
/// ```
class HorizontalInfoCard extends StatelessWidget {
  final String textValue;
  final String textDescription;

  const HorizontalInfoCard({
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
              blurRadius: 4,
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Container(
        decoration:
            const BoxDecoration(color: kPrimaryColorWithOpacityBG, borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Padding(
          padding: const EdgeInsets.only(right: 12, top: 20, left: 12, bottom: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textValue,
                style: kTitleTextStyle.copyWith(
                  color: kkMyrtleGreenWithOpacity,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  textDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
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
