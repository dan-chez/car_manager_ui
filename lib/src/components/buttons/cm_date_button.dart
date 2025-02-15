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

import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/decoration_constants.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

/// A custom button widget that displays a read-only text field with a suffix icon
/// and triggers a callback when tapped.
///
/// This widget is typically used for date selection, displaying the selected value
/// as [txtLabel] and showing [hintText] as a label.
///
/// Example usage:
/// ```dart
/// CMDateButton(
///   txtLabel: 'February 2025',
///   hintText: 'Month',
///   onPressed: () {
///     // Open a date picker
///   },
/// )
/// ```
///
/// By default, it shows [kDropdownIcon] as the suffix icon, but you can
/// customize it by passing any other widget to the [icon] property.
class CMDateButton extends StatelessWidget {
  final String txtLabel;
  final String hintText;
  final Widget icon;
  final VoidCallback onPressed;
  const CMDateButton({
    super.key,
    required this.txtLabel,
    required this.hintText,
    required this.onPressed,
    this.icon = kDropdownIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      readOnly: true,
      onTap: onPressed,
      controller: TextEditingController()..text = txtLabel,
      keyboardType: TextInputType.text,
      decoration: kTextFieldInputDecoration.copyWith(
        labelText: hintText,
        labelStyle: kContentTextStyle,
        suffixIcon: icon,
      ),
      style: kContentTextStyle,
    );
  }
}
