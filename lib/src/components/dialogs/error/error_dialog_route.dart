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
