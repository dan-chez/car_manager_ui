import 'package:carmanager_ui/src/components/dialogs/base/dialog_base.dart';
import 'package:carmanager_ui/src/components/dialogs/loading/loading_dialog_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// To call [LoadingDialog] follow next example
/// Example usage:
/// ```dart
/// context.push(
///   LoadingDialogRoute.path,
///   extra: LoadingDialogRoute(...),
///   ),
/// );
/// ```
class LoadingDialog extends DialogBase<LoadingDialogData> {
  const LoadingDialog({
    super.key,
    required super.data,
  });

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Center(
          child: SizedBox(
            height: data.height,
            width: data.width,
            child: Lottie.asset(data.lottieAssetPath),
          ),
        ),
      );
}
