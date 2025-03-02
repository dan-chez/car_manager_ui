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

import 'package:carmanager_ui/src/components/selectable_vehicle_type/selectable_vehicle_type_item.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
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
/// SelectableVehicleType(
///   items: const [
///     SelectableVehicleTypeItem(id: '1', icon: 'car.svg', description: 'Car'),
///     SelectableVehicleTypeItem(id: '2', icon: 'bike.svg', description: 'Bike'),
///   ],
///   onSelected: (selectedVehicle) {
///     printValue('Selected vehicle: $selectedVehicle');
///   },
/// )
/// ```
class SelectableVehicleType extends StatefulWidget {
  /// The list of available vehicle options.
  final List<SelectableVehicleTypeItem> items;

  /// Callback triggered when a vehicle is selected, returning the selected vehicle's ID.
  final ValueChanged<String> onSelected;

  const SelectableVehicleType({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  State<SelectableVehicleType> createState() => _SelectableVehicleTypeState();
}

class _SelectableVehicleTypeState extends State<SelectableVehicleType> {
  /// Spacing between items.
  static const double _wrapSpacing = 8;

  static const double _iconSize = 24;

  String? selectedId;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: _wrapSpacing,
          runSpacing: _wrapSpacing,
          children: widget.items.map((item) {
            final isSelected = item.id == selectedId;

            final containerWidth =
                (constraints.maxWidth / widget.items.length) - _wrapSpacing;

            return GestureDetector(
              onTap: () {
                setState(() => selectedId = item.id);
                widget.onSelected(item.id);
              },
              child: Container(
                width: containerWidth,
                constraints: const BoxConstraints(minWidth: 80),
                decoration: BoxDecoration(
                  color: kWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: kBoxShadowColor,
                      blurRadius: 4,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isSelected ? kMyrtleGreen : kPrimaryColorWithOpacityBG,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        item.icon,
                        colorFilter: ColorFilter.mode(
                          isSelected ? kWhite : kAmaranthPrimary,
                          BlendMode.srcIn,
                        ),
                        width: _iconSize,
                        height: _iconSize,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kCMButtonTextStyle.copyWith(
                            color: isSelected ? kWhite : kMyrtleGreen,
                          ),
                        ),
                      ),
                      if (isSelected) kCheckIcon,
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
