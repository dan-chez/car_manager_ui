import 'package:carmanager_ui/src/components/dialogs/base/dialog_page_base.dart';
import 'package:carmanager_ui/src/components/dialogs/loading/loading_dialog.dart';
import 'package:carmanager_ui/src/components/dialogs/loading/loading_dialog_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Route class to call loading dialog
/// Example usage:
/// ```dart
/// context.push(
///   LoadingDialogRoute.path,
///   extra: LoadingDialogRoute(...),
///   ),
/// );
/// ```
class LoadingDialogRoute {
  static const String path = '/loadingDialog';

  static Page<void> createRoute(
    BuildContext context,
    GoRouterState state, {
    required LoadingDialogData dialogData,
  }) {
    return DialogPageBase(
      child: LoadingDialog(data: dialogData),
    );
  }
}
