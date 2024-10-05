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

import 'package:carmanager_ui/src/components/buttons/close_icon_button.dart';
import 'package:carmanager_ui/src/components/cm_rich_text.dart';
import 'package:carmanager_ui/src/components/dialogs/base/dialog_base.dart';
import 'package:carmanager_ui/src/components/dialogs/error/error_dialog_data.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/dividers.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// To call [ErrorDialog] follow next example
/// Example usage:
/// ```dart
/// context.push(
///   ErrorDialogRoute.path,
///   extra: ErrorDialogRoute(...),
///   ),
/// );
/// ```
class ErrorDialog extends DialogBase<ErrorDialogData> {
  const ErrorDialog({
    super.key,
    required super.data,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: kWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 11.0, right: 11.0),
            child: CloseIconButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 36),
            child: Column(
              children: [
                Visibility(
                  visible: data.imagePath.isNotEmpty,
                  child: SvgPicture.asset(data.imagePath),
                ),
                kSmallDividerVertical,
                CMRichText(
                  text: data.title,
                  boldPositions: data.titleBoldPositions,
                )(),
                Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: kCaptionTextStyle.copyWith(
                      fontWeight: FontWeight.w300, color: kMyrtleGreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
