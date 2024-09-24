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

import 'package:carmanager_ui/src/components/dialogs/base/dialog_page_base.dart';
import 'package:carmanager_ui/src/components/dialogs/confirm/confirm_dialog.dart';
import 'package:carmanager_ui/src/components/dialogs/confirm/confirm_dialog_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Route class to call confirm dialog
/// Example usage:
/// ```dart
/// context.push(
///   ConfirmDialogRoute.path,
///   extra: ConfirmDialogData(...),
///   ),
/// );
/// ```
class ConfirmDialogRoute {
  static const String path = '/confirmDialog';

  static Page<void> createRoute(
    BuildContext context,
    GoRouterState state, {
    required ConfirmDialogData dialogData,
  }) {
    return DialogPageBase(
      child: ConfirmDialog(data: dialogData),
    );
  }
}
