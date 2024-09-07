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
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A custom app bar widget that provides a consistent design for the application's
/// app bar across different screens. The [CMAppbar] is a `StatelessWidget` that
/// implements the `PreferredSizeWidget` interface, allowing it to be used as an app
/// bar in a `Scaffold`. It includes an optional asset logo and a back navigation
/// button if the current route can be popped from the navigation stack.
///
/// Example usage:
/// ```dart
/// CMAppbar(
///   assetName: 'assets/logo.svg',
/// )
/// ```
class CMAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? assetName;

  const CMAppbar({
    super.key,
    this.assetName,
  });

  /// Use the Appbar from flutter to set CMAppbar height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    final asset = assetName ?? '';
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: kWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: canPop ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: canPop,
                  child: IconButton(
                    constraints: const BoxConstraints(minHeight: 0),
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 4),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      if (canPop) {
                        Navigator.pop(context);
                      }
                    },
                    icon: kBackArrowIcon,
                  ),
                ),
                  Visibility(
                    visible: assetName != null,
                    child: SvgPicture.asset(
                      asset,
                      height: 25,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
