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

import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_radio.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_item_data.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of selectable car items using radio buttons.
/// If the user selects the already selected item, the dialog is closed.
class CarPickerItems extends StatefulWidget {
  final List<CarPickerItemData> items;
  final String? selectedItem;
  final Function(String) onItemSelected;

  const CarPickerItems({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  State<CarPickerItems> createState() => _CarPickerItemsState();
}

class _CarPickerItemsState extends State<CarPickerItems> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: CMDimens.d16,
      children: widget.items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: CMDimens.d16),
          child: Container(
            padding: EdgeInsets.only(
              right: CMDimens.d18,
              top: CMDimens.d11,
              bottom: CMDimens.d11,
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
            child: CarPickerRadio(
              item: item,
              groupValue: selectedItem,
              onItemSelected: (selectedItem) {
                setState(() {
                  widget.onItemSelected(selectedItem);
                  if (this.selectedItem == selectedItem) {
                    Navigator.pop(context);
                  } else {
                    this.selectedItem = selectedItem;
                  }
                });
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
