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
import 'package:flutter/material.dart';

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

  static const _switchSize = Size(28, 16);
  static const _circleSize = 10.0;
  static const _borderRadius = BorderRadius.all(Radius.circular(14));
  static const _animationDuration = Duration(milliseconds: 250);
  static const _padding = EdgeInsets.symmetric(horizontal: 2, vertical: 2);

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
          border: Border.all(color: isOn ? activeColor : inactiveColor, width: 2),
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
