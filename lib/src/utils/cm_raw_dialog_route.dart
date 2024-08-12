import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';

/// The [createRawDialogRoute] function creates a custom animated dialog route.
/// The `settings` argument defines the configuration for this route.
/// The `child` argument is the widget that will be displayed in the dialog.
RawDialogRoute createRawDialogRoute({
  required RouteSettings settings,
  required Widget child,
}) {
  return RawDialogRoute(
    settings: settings,
    barrierColor: kBarrierColor,
    pageBuilder: (_, __, ___) => const SizedBox(),
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, _, __) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  );
}
