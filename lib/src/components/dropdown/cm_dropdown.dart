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
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/decoration_constants.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

/// A custom dropdown widget that allows the user to select from a list of key-value pairs.
///
/// Example usage:
/// ```dart
/// CMDropdown(
///   items: {'1': 'Option 1', '2': 'Option 2'},
///   labelText: 'Select an option',
///   hintText: 'Please select',
///   disabledHintText: 'No options available',
///   onItemSelected: (value, key) {
///     print('Selected value: $value, key: $key');
///   },
/// )
/// ```
class CMDropdown extends StatelessWidget {
  /// A map of key-value pairs representing the dropdown items.
  /// The keys are used as the unique identifiers for the items,
  /// and the values are the display text.
  final Map<String, String> items;

  /// The label text that appears above the dropdown field.
  final String labelText;

  /// The hint text that appears within the dropdown when no selection has been made.
  final String hintText;

  /// The hint text that appears when the dropdown is disabled due to an empty items list.
  final String disabledHintText;

  /// A callback function that is triggered when an item is selected.
  /// The callback provides the selected value and its corresponding key.
  final void Function(String?, String?) onItemSelected;

  const CMDropdown({
    super.key,
    required this.items,
    required this.labelText,
    required this.hintText,
    required this.disabledHintText,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Access the current theme to apply appropriate styling.
    var theme = Theme.of(context  );

    // Determine if the dropdown should be enabled based on the presence of items.
    bool isEnabled = items.isNotEmpty;

    // Set the main color for the dropdown, adjusting for disabled state.
    Color mainColor = isEnabled ? theme.colorScheme.onSurface : kGreyDisable;

    return DropdownButtonFormField<String>(
      borderRadius: const BorderRadius.all(Radius.zero),
      hint: Text(
        hintText,
        style: kContentTextStyle,
      ),
      disabledHint: Text(
        disabledHintText,
        style: kContentTextStyle.copyWith(color: mainColor),
      ),
      icon: kArrowDownIcon,
      decoration: kTextFieldInputDecoration.copyWith(
        labelText: labelText,
      ),
      onChanged: isEnabled ? _onChanged : null,
      items: _getItems(),
    );
  }

  /// Handles the selection of an item from the dropdown.
  ///
  /// This method updates the selected key and value based on the user's choice,
  /// and triggers the [onItemSelected] callback with the selected value and key.
  void _onChanged(String? selectedKey) {
    final selectedValue = items[selectedKey];
    onItemSelected(selectedValue, selectedKey);
  }

  /// Generates a list of `DropdownMenuItem` widgets from the provided [items].
  ///
  /// This method iterates over the entries of the [items] map, creating a
  /// `DropdownMenuItem` for each key-value pair. These items are displayed
  /// in the dropdown menu.
  List<DropdownMenuItem<String>> _getItems() {
    return items.entries.map((entry) {
      return DropdownMenuItem(
        value: entry.key,
        child: Text(entry.value, style: kContentTextStyle),
      );
    }).toList();
  }
}
