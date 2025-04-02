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
    pageBuilder: (_, __, ___) => const SizedBox(), // coverage:ignore-line
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
