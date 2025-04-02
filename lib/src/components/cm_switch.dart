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

import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:flutter/material.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';

/// A customizable toggle switch with smooth animations.
/// Changes state when tapped and calls the `onChanged` callback.
class CMSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CMSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CMSwitch> createState() => _CMSwitchState();
}

class _CMSwitchState extends State<CMSwitch> {
  late bool isOn;

  static const _switchSize = Size(CMDimens.d28, CMDimens.d16);
  static const _circleSize = CMDimens.d10;
  static const _borderRadius = BorderRadius.all(Radius.circular(CMDimens.d14));
  static const _animationDuration = Duration(milliseconds: 250);
  static const _padding = EdgeInsets.all(CMDimens.d2);

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void _toggleSwitch() {
    setState(() {
      isOn = !isOn;
      widget.onChanged(isOn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = kAmaranthPrimary;
    final Color inactiveColor = kSilver;

    return InkWell(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: _animationDuration,
        width: _switchSize.width,
        height: _switchSize.height,
        padding: _padding,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          border: Border.all(
            color: isOn ? activeColor : inactiveColor,
            width: CMDimens.d2,
          ),
        ),
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: _animationDuration,
          width: _circleSize,
          height: _circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOn ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }
}
