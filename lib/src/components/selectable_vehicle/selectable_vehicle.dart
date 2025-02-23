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

import 'package:carmanager_ui/src/components/selectable_vehicle/selectable_vehicle_item.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays a horizontally selectable list of vehicles.
/// Each vehicle is represented by an icon and a description.
///
/// When a vehicle is selected, the widget highlights it and triggers the [onSelected] callback.
///
/// Example usage:
/// ```dart
/// SelectableVehicle(
///   items: const [
///     SelectableVehicleItem(id: '1', icon: kSelectableCarImage, description: 'Car'),
///     SelectableVehicleItem(id: '2', icon: kSelectableBikeImage, description: 'Bike'),
///   ],
///   onSelected: (selectedVehicle) {
///     printValue('Selected vehicle: $selectedVehicle');
///   },
/// )
/// ```
class SelectableVehicle extends StatefulWidget {
  /// The list of available vehicle options.
  final List<SelectableVehicleItem> items;

  /// Callback triggered when a vehicle is selected, returning the selected vehicle's ID.
  final ValueChanged<String> onSelected;

  const SelectableVehicle({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  State<SelectableVehicle> createState() => _SelectableVehicleState();
}

class _SelectableVehicleState extends State<SelectableVehicle> {
  /// Defines 90% of the screen width as the available width for the widget.
  static const double _availableWidthFactor = 0.9;

  /// Allocates 50% of the item width for the description text.
  static const double _availableTextWidthFactor = 0.5;

  String? selectedId;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth * _availableWidthFactor) / widget.items.length;
    final textWidth = itemWidth * _availableTextWidthFactor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.items.map((item) {
        final isSelected = item.id == selectedId;

        return GestureDetector(
          onTap: () {
            setState(() => selectedId = item.id);
            widget.onSelected(item.id);
          },
          child: Container(
            width: itemWidth,
            decoration: const BoxDecoration(
              color: kWhite,
              boxShadow: [
                BoxShadow(
                  color: kBoxShadowColor,
                  blurRadius: 4,
                  offset: Offset(0, 5),
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  6,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? kMyrtleGreen : kPrimaryColorWithOpacityBG,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      item.icon,
                      colorFilter: ColorFilter.mode(
                        isSelected ? kWhite : kAmaranthPrimary,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: textWidth,
                      child: Text(
                        item.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kCMButtonTextStyle.copyWith(
                          color: isSelected ? kWhite : kMyrtleGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
