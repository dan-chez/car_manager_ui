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
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_item_data.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

/// A custom radio button widget for selecting a car item.
///
/// This widget displays a selectable radio button along with the car's name
/// and plate number. When tapped, it triggers the `onItemSelected` callback
/// with the selected item's ID.
/// The selection is visually indicated by changing the radio button's color.
class CarPickerRadio extends StatefulWidget {
  final CarPickerItemData item;
  final String? groupValue;
  final Function(String) onItemSelected;

  const CarPickerRadio({
    super.key,
    required this.item,
    required this.groupValue,
    required this.onItemSelected,
  });

  @override
  State<CarPickerRadio> createState() => _CarPickerRadioState();
}

class _CarPickerRadioState extends State<CarPickerRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.item.id == widget.groupValue);

    return InkWell(
      onTap: () => widget.onItemSelected(widget.item.id),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: CMDimens.d9),
            padding: const EdgeInsets.all(CMDimens.d4),
            decoration: BoxDecoration(shape: BoxShape.circle, color: kRadioBg),
            child: Icon(
              Icons.circle,
              size: CMDimens.d16,
              color: selected ? kAmaranthPrimary : kRadioBg,
            ),
          ),
          Expanded(
            child: Text(
              widget.item.name,
              style: kCarPickerItemTextStyle,
            ),
          ),
          CMRichText(
            text: widget.item.plate,
            boldPositions: [1],
            textStyle: kCarPickerPlateTextStyle,
          )()
        ],
      ),
    );
  }
}
