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
import 'package:carmanager_ui/src/components/cm_switch.dart';
import 'package:carmanager_ui/src/components/vehicle_info_card/vehicle_info_card_type.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/dividers.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

/// The [VehicleInfoCard] widget is used to display detailed information about a vehicle.
///
/// This widget supports two modes:
/// - [VehicleInfoCardType.toggleable]: Displays a toggle switch [CMSwitch]
///   that allows enabling or disabling the visibility of additional details.
/// - [VehicleInfoCardType.fixed]: Hides the switch and always displays
///   the full vehicle details, making the card always active.
///
/// Example usage:
/// ```dart
/// VehicleInfoCard(
///   type: VehicleInfoCardType.toggleable,
///   vehicleInfo: myVehicleInfo,
///   onDeletePressed: () {
///     print('Delete action triggered');
///   },
///   onEditPressed: () {
///     print('Edit action triggered');
///   },
/// )
/// ```
///
/// When `VehicleInfoCardType.fixed` is used:
/// ```dart
/// VehicleInfoCard(
///   type: VehicleInfoCardType.fixed,
///   vehicleInfo: myVehicleInfo,
/// )
/// ```
class VehicleInfoCard extends StatefulWidget {
  final String name;
  final String plate;
  final String kms;
  final String vehicleType;
  final VehicleInfoCardType type;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onEditPressed;

  const VehicleInfoCard({
    super.key,
    required this.name,
    required this.plate,
    required this.kms,
    required this.vehicleType,
    this.type = VehicleInfoCardType.toggleable,
    this.onDeletePressed,
    this.onEditPressed,
  });

  @override
  State<VehicleInfoCard> createState() => _VehicleInfoCardState();
}

class _VehicleInfoCardState extends State<VehicleInfoCard> {
  late final ValueNotifier<bool> _isEnabled;

  @override
  void initState() {
    super.initState();
    _isEnabled = ValueNotifier(widget.type == VehicleInfoCardType.fixed);
  }

  @override
  void dispose() {
    _isEnabled.dispose();
    super.dispose();
  }

  void _toggleSwitch(bool value) {
    if (widget.type == VehicleInfoCardType.toggleable) {
      _isEnabled.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _isEnabled,
      builder: (context, _) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: CMDimens.d16,
            vertical: CMDimens.d11,
          ),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(CMDimens.d5),
            boxShadow: [
              BoxShadow(
                color: kBoxShadowColor,
                offset: const Offset(CMDimens.d0, CMDimens.d2),
                blurRadius: CMDimens.d7,
              ),
            ],
          ),
          child: Column(
            children: [
              _buildHeader(),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: getCrossFadeState(),
                firstChild: const SizedBox.shrink(),
                secondChild: _buildDetails(),
              ),
            ],
          ),
        );
      },
    );
  }

  CrossFadeState getCrossFadeState() {
    return (_isEnabled.value || widget.type == VehicleInfoCardType.fixed)
        ? CrossFadeState.showSecond
        : CrossFadeState.showFirst;
  }

  Widget _buildHeader() {
    return Row(
      children: [
        if (widget.type == VehicleInfoCardType.toggleable) ...[
          CMSwitch(
            initialValue: _isEnabled.value,
            onChanged: _toggleSwitch,
          ),
          SizedBox(width: CMDimens.d12),
        ],
        Expanded(
          child: Text(
            widget.name.toUpperCase(),
            style: kContentTextStyle.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (_isEnabled.value || widget.type == VehicleInfoCardType.fixed) ...[
          InkWell(
            onTap: widget.onEditPressed,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: kEditSquareIcon,
          ),
          const SizedBox(width: CMDimens.d16),
          InkWell(
            onTap: widget.onDeletePressed,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: kDeleteIcon,
          ),
        ],
      ],
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        const SizedBox(height: CMDimens.d10),
        kSecondaryDivider,
        const SizedBox(height: CMDimens.d10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailText(widget.kms, boldPositions: [0]),
            _buildDetailText(widget.plate, flex: 2, boldPositions: [1]),
            _buildDetailText(widget.vehicleType, flex: 2),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailText(String text, {int flex = 1, List<int> boldPositions = const []}) {
    return Flexible(
      flex: flex,
      child: CMRichText(
        text: text,
        boldPositions: boldPositions,
        textStyle: kCaptionTextStyle.copyWith(color: kGreyDisable),
      )(),
    );
  }
}
