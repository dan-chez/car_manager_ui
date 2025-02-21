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

import 'package:carmanager_ui/src/components/loader/loader.dart';
import 'package:carmanager_ui/src/constants/button_constants.dart';
import 'package:carmanager_ui/src/constants/int_constants.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.isEnabled = true,
    required this.txtLabel,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.icon,
    this.isLoading = false,
  });

  final bool isEnabled;
  final String txtLabel;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Widget? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCMButtonHeight,
      width: double.infinity,
      child: TextButton(
        style: buttonStyle ?? kCMButtonStyle,
        onPressed: isEnabled && !isLoading ? onPressed : null,
        child: Visibility(
          visible: !isLoading,
          replacement: const Loader(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: icon,
                ),
              Text(
                txtLabel,
                style: textStyle ?? kCMButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
