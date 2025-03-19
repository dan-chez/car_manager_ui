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

/// The [CurrentVehicleCard] widget displays information about a vehicle,
/// including its name and plate, within a styled container that reacts to tap events.
///
/// Example usage:
/// ```dart
/// CurrentVehicleCard(
///   vehicleName: 'Chevrolet Spark GT',
///   vehiclePlate: 'Plate:|ABC123',
///   plateBoldPositions: [1],
///   onPressed: () {
///     // Handle tap event
///   },
/// );
/// ```
class CurrentVehicleCard extends StatelessWidget {
  final String vehicleName;
  final String vehiclePlate;
  final List<int> plateBoldPositions;
  final VoidCallback onPressed;

  const CurrentVehicleCard({
    super.key,
    required this.vehicleName,
    required this.vehiclePlate,
    this.plateBoldPositions = const [],
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          CMDimens.d10,
          CMDimens.d10,
          CMDimens.d16,
          CMDimens.d10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CMDimens.d2),
          color: kWhite,
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
                  kCheckIconRed,
                  const SizedBox(width: CMDimens.d8),
                  Flexible(
                    child: Text(
                      vehicleName.toUpperCase(),
                      style: kCaptionTextStyle.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: CMDimens.d7),
            Expanded(
              child: CMRichText(
                text: vehiclePlate,
                boldPositions: plateBoldPositions,
                maxLines: 1,
                textStyle: kCaptionTextStyle.copyWith(color: kGreyDisable),
                textAlign: TextAlign.start,
              )(),
            ),
            const SizedBox(width: CMDimens.d7),
            kArrowForwardIcon
          ],
        ),
      ),
    );
  }
}
