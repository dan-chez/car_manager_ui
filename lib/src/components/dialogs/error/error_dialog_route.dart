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
import 'package:carmanager_ui/src/components/dialogs/error/error_dialog.dart';
import 'package:carmanager_ui/src/components/dialogs/error/error_dialog_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Route class to call error dialog
/// Example usage:
/// ```dart
/// context.push(
///   ErrorDialogRoute.path,
///   extra: ErrorDialogRoute(...),
///   ),
/// );
/// ```
class ErrorDialogRoute {
  static const String path = '/errorDialog';

  static Page<void> createRoute(
    BuildContext context,
    GoRouterState state, {
    required ErrorDialogData dialogData,
  }) {
    return DialogPageBase(
      child: ErrorDialog(data: dialogData),
    );
  }
}
