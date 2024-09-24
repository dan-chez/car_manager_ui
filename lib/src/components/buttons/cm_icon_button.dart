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

/// A customizable icon button with optional sizing and tap interaction.
///
/// The [CMIconButton] widget is a simple icon button that allows you to specify an [icon] and an
/// [onPressed] callback. The size of the button can be controlled using the optional [size] property,
/// which sets the width and height of the button.
///
/// Example usage:
/// ```dart
/// CMIconButton(
///   icon: Icon(Icons.add),
///   onPressed: () {
///     print('Icon button pressed');
///   },
///   size: Size(50, 50),
/// );
/// ```
class CMIconButton extends StatelessWidget {
  const CMIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size,
  });

  final VoidCallback? onPressed;
  final Icon icon;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height,
      width: size?.width,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: icon,
      ),
    );
  }
}
