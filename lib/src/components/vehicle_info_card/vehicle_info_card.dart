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

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/cm_switch.dart';
import 'package:carmanager_ui/src/constants/dividers.dart';
import 'package:flutter/material.dart';

/// The [VehicleInfoCard] widget is used to display detailed information about a vehicle.
///
/// This widget supports two modes:
/// - [VehicleInfoCardType.selectable]: Displays a toggle switch [CMSwitch]
///   that allows enabling or disabling the visibility of additional details.
/// - [VehicleInfoCardType.nonSelectable]: Hides the switch and always displays
///   the full vehicle details, making the card always active.
///
/// Example usage:
/// ```dart
/// VehicleInfoCard(
///   type: VehicleInfoCardType.selectable,
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
/// When `VehicleInfoCardType.nonSelectable` is used:
/// ```dart
/// VehicleInfoCard(
///   type: VehicleInfoCardType.nonSelectable,
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
    this.type = VehicleInfoCardType.selectable,
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
    _isEnabled = ValueNotifier(widget.type == VehicleInfoCardType.nonSelectable);
  }

  @override
  void dispose() {
    _isEnabled.dispose();
    super.dispose();
  }

  void _toggleSwitch(bool value) {
    if (widget.type == VehicleInfoCardType.selectable) {
      _isEnabled.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _isEnabled,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: kBoxShadowColor,
                offset: const Offset(0, 2),
                blurRadius: 7.2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: (_isEnabled.value || widget.type == VehicleInfoCardType.nonSelectable)
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: _buildDetails(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        if (widget.type == VehicleInfoCardType.selectable) ...[
          CMSwitch(
            initialValue: _isEnabled.value,
            onChanged: _toggleSwitch,
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(
            widget.name.toUpperCase(),
            style: kContentTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (_isEnabled.value || widget.type == VehicleInfoCardType.nonSelectable) ...[
          InkWell(
            onTap: widget.onEditPressed,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: kEditSquareIcon,
          ),
          const SizedBox(width: 16),
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
        const SizedBox(height: 10),
        kSecondaryDivider,
        const SizedBox(height: 10),
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

enum VehicleInfoCardType { selectable, nonSelectable }
