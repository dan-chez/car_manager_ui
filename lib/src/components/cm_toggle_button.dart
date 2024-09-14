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

import 'package:flutter/material.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

/// A custom toggle button widget with animated transitions and customizable background colors.
///
/// The [CMToggleButton] widget allows users to toggle between multiple options,
/// with dynamic background colors, customizable labels, and smooth animations.
///
/// Example usage:
/// ```dart
/// CMToggleButton(
///   switchButtonLabels: ['Option 1', 'Option 2'],
///   activeBgColor: Colors.blue,
///   onChanged: (index) {
///     print('Selected index: $index');
///   },
/// );
/// ```
///
/// The [onChanged] callback function is triggered whenever a new option is selected,
/// passing the index of the selected toggle. The [activeBgColor] defines the background color
/// of the active toggle option.
class CMToggleButton extends StatefulWidget {
  final Function(int) onChanged;
  final List<String> switchButtonLabels;
  final Color activeBgColor;

  const CMToggleButton({
    super.key,
    required this.onChanged,
    required this.switchButtonLabels,
    this.activeBgColor = kMyrtleGreen,
  });

  @override
  State<CMToggleButton> createState() => _CMToggleButtonState();
}

class _CMToggleButtonState extends State<CMToggleButton> {
  int _switchButtonIndexSelected = 0;

  bool _isToggleLocked = false;

  @override
  Widget build(BuildContext context) {
    final List<TextStyle> itemsTextStyle = [];
    final List<List<Color>> activeBGColors = [];
    final List<double> customWidths = [];
    for (int i = 0; i < widget.switchButtonLabels.length; i++) {
      activeBGColors.add([widget.activeBgColor]);
      customWidths.add(i == _switchButtonIndexSelected ? 95 : 85);
      itemsTextStyle.add(
        kContentTextStyle.copyWith(
            fontWeight: i == _switchButtonIndexSelected ? FontWeight.w500 : FontWeight.w300,
            color: i == _switchButtonIndexSelected ? kWhite : kMyrtleGreen),
      );
    }

    return ToggleSwitch(
        changeOnTap: false,
        minWidth: 90.0,
        customWidths: customWidths,
        cornerRadius: 125.0,
        activeBgColors: activeBGColors,
        animate: true,
        curve: Curves.fastLinearToSlowEaseIn,
        animationDuration: 500,
        activeFgColor: kMyrtleGreen,
        inactiveBgColor: kInactiveToggleButtonSelection,
        initialLabelIndex: _switchButtonIndexSelected,
        totalSwitches: widget.switchButtonLabels.length,
        labels: widget.switchButtonLabels,
        radiusStyle: true,
        customTextStyles: itemsTextStyle,
        onToggle: (index) {
          if (!_isToggleLocked) {
            _isToggleLocked = true;
            //The delay is applied to wait for the animation of the average daily income card
            Future.delayed(const Duration(milliseconds: 500), () {
              _isToggleLocked = false;
            });
            setState(() {
              widget.onChanged(index ?? 0);
              _switchButtonIndexSelected = index ?? 0;
            });
          }
        });
  }
}
