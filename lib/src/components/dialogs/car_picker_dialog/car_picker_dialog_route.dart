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

// coverage:ignore-file
import 'package:carmanager_ui/src/components/dialogs/base/dialog_page_base.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_dialog.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_dialog_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Route class to call confirm dialog
/// Example usage:
/// ```dart
/// context.push(
///   CarPickerDialogRoute.path,
///   extra: CarPickerDialogData(...),
///   ),
/// );
/// ```
class CarPickerDialogRoute {
  static const String path = '/carPickerDialog';

  static Page<void> createRoute(
    BuildContext context,
    GoRouterState state, {
    required CarPickerDialogData dialogData,
  }) {
    return DialogPageBase(
      child: CarPickerDialog(data: dialogData),
    );
  }
}
