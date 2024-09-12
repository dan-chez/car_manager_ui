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
