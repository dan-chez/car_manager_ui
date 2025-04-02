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
import 'package:carmanager_ui/src/components/buttons/primary_button.dart';
import 'package:carmanager_ui/src/components/cm_rich_text.dart';
import 'package:carmanager_ui/src/components/dialogs/confirm/confirm_dialog_data.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base/dialog_base.dart';

/// To call [ConfirmDialog] follow next example
/// Example usage:
/// ```dart
/// context.push(
///   ConfirmDialogRoute.path,
///   extra: ConfirmDialogData(...),
///   ),
/// );
/// ```
class ConfirmDialog extends DialogBase<ConfirmDialogData> {
  const ConfirmDialog({
    super.key,
    required super.data,
  });

  @override
  Widget build(BuildContext context) {
    String asset = data.image ?? '';
    return PopScope(
      canPop: data.canPop,
      child: Dialog(
        elevation: CMDimens.d10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CMDimens.d4),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: CMDimens.d24),
        backgroundColor: kWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: data.showCloseButton,
              child: const Padding(
                padding: EdgeInsets.only(
                  top: CMDimens.d11,
                  right: CMDimens.d11,
                ),
                child: CloseIconButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: CMDimens.d6,
                bottom: CMDimens.d25,
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: data.image != null,
                    child: SizedBox(
                      height: CMDimens.d42,
                      width: CMDimens.d42,
                      child: SvgPicture.asset(asset),
                    ),
                  ),
                  const SizedBox(height: CMDimens.d20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CMDimens.d35,
                    ),
                    child: CMRichText(
                      text: data.message,
                      textStyle: kSubtitleTextStyle,
                      textDivider: data.textDivider,
                      boldPositions: data.boldPositions,
                    )(),
                  ),
                  const SizedBox(height: CMDimens.d30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CMDimens.d12,
                    ),
                    child: PrimaryButton(
                      txtLabel: data.buttonText,
                      onPressed: () {
                        if (data.popWhenOnPressed) {
                          Navigator.pop(context);
                        }
                        if (data.onPressed != null) {
                          data.onPressed?.call();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
