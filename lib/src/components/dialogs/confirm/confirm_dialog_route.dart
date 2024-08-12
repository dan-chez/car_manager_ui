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
