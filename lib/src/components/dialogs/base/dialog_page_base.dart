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
