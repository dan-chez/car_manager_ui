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
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_items.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_dialog_data.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/dividers.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../base/dialog_base.dart';

/// To call [CarPickerDialog] follow next example
/// Example usage:
/// ```dart
/// context.push(
///   CarPickerDialogRoute.path,
///   extra: CarPickerDialogData(...),
///   ),
/// );
/// ```
class CarPickerDialog extends DialogBase<CarPickerDialogData> {
  const CarPickerDialog({
    super.key,
    required super.data,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
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
            const Padding(
              padding: EdgeInsets.only(right: CMDimens.d4),
              child: CloseIconButton(),
            ),
            Text(
              data.title,
              style: kCarPickerTitleTextStyle,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: CMDimens.d12,
                vertical: CMDimens.d16,
              ),
              child: kPrimaryDivider,
            ),
            CarPickerItems(
              items: data.items,
              selectedItem: data.selectedId,
              onItemSelected: data.onItemSelected,
            ),
            const SizedBox(
              height: CMDimens.d32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CMDimens.d16,
                vertical: CMDimens.d24,
              ),
              child: PrimaryButton(
                txtLabel: data.buttonText,
                onPressed: () {
                  Navigator.pop(context);
                  data.onButtonPressed.call();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
