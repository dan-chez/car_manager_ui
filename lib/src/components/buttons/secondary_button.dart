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

/// A customizable secondary button with an outlined style.
/// This button supports enabling/disabling states and stretches to full width.
///
/// Example usage:
/// ```dart
/// SecondaryButton(
///   label: 'Click me',
///   onSelected: () {
///     print('Button clicked');
///   },
///   isEnabled: true,
/// )
/// ```
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
  });

  final bool isEnabled;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = isEnabled ? kAmaranthPrimary : kSilver;
    return SizedBox(
      height: CMDimens.d56,
      width: double.infinity,
      child: TextButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(CMDimens.d4)),
          ),
          side: BorderSide(color: isEnabled ? kAmaranthPrimary : kSilver),
          padding: const EdgeInsets.all(CMDimens.d16),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: CMDimens.d8),
              child: Icon(
                Icons.add_circle_outline,
                color: color,
                size: CMDimens.d21,
              ),
            ),
            Text(
              label,
              style: kCMOutLinedButtonTextStyle.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
