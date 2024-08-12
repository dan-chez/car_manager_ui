import 'package:carmanager_ui/src/components/dialogs/base/dialog_base.dart';
import 'package:carmanager_ui/src/utils/cm_raw_dialog_route.dart';
import 'package:flutter/material.dart';

/// A custom Page class for creating dialog routes.
class DialogPageBase extends Page {
  /// The dialog widget that will be displayed.
  final DialogBase child;

  const DialogPageBase({
    required this.child,
  });

  @override
  Route createRoute(BuildContext context) {
    return createRawDialogRoute(
      settings: this,
      child: child,
    );
  }
}
