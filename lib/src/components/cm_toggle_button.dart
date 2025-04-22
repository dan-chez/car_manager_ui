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
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

/// A custom toggle button widget with animated transitions and customizable background colors.
///
/// The [CMToggleButton] widget allows users to toggle between multiple options,
/// with dynamic background colors, customizable labels, and smooth animations.
///
/// Example usage:
/// ```dart
/// CMToggleButton(
///   labels: ['Option 1', 'Option 2'],
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
  final List<String> labels;
  final Color activeBgColor;

  const CMToggleButton({
    super.key,
    required this.onChanged,
    required this.labels,
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
    final labels = widget.labels;
    final activeColors = List.generate(labels.length, (_) => [widget.activeBgColor]);
    final textStyles = List.generate(
      labels.length,
      (i) => kContentTextStyle.copyWith(
        fontWeight: i == _switchButtonIndexSelected ? FontWeight.w500 : FontWeight.w300,
        color: i == _switchButtonIndexSelected ? kWhite : kMyrtleGreen,
      ),
    );

    return LayoutBuilder(
      builder: (_, constraints) {
        final totalWidth = constraints.maxWidth;
        final count = labels.length;
        const extra = 10.0;
        final baseWidth = (totalWidth - extra) / count;
        final widths = List<double>.generate(
          count,
          (i) => i == _switchButtonIndexSelected ? baseWidth + extra : baseWidth,
        );

        return ToggleSwitch(
          changeOnTap: false,
          customWidths: widths,
          cornerRadius: CMDimens.d125,
          activeBgColors: activeColors,
          inactiveBgColor: kInactiveToggleButtonSelection,
          activeFgColor: kMyrtleGreen,
          customTextStyles: textStyles,
          animate: true,
          animationDuration: 500,
          curve: Curves.fastLinearToSlowEaseIn,
          initialLabelIndex: _switchButtonIndexSelected,
          totalSwitches: count,
          labels: labels,
          radiusStyle: true,
          onToggle: (index) {
            if (!_isToggleLocked) {
              _isToggleLocked = true;
              // A delay is applied to allow time for any ongoing animations to complete.
              Future.delayed(const Duration(milliseconds: 500), () {
                _isToggleLocked = false;
              });
              setState(() {
                widget.onChanged(index ?? 0);
                _switchButtonIndexSelected = index ?? 0;
              });
            }
          },
        );
      },
    );
  }
}
