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

import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/cm_appbar/cm_appbar_back_showcase.dart';
import 'package:car_manager_ui/showcases/cm_appbar/cm_appbar_no_back_showcase.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The [CMAppbarShowcase] class provides a visual representation of various [CMAppbar]
/// styles and functionalities within the application.
class CMAppbarShowcase extends StatelessWidget {
  /// This path is used to navigate to the CMAppBar showcase using GoRouter.
  static String path = '/cmAppbar';

  const CMAppbarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMAppBar showcase',
      children: [
        createShowcaseTitle('CMAppBar with back button'),
        PrimaryButton(
          txtLabel: 'Click me',
          onPressed: () {
            context.push(CMAppbarBackShowcase.path);
          },
        ),
        createShowcaseTitle('CMAppBar without back button'),
        PrimaryButton(
          txtLabel: 'Click me',
          onPressed: () {
            context.go(CMAppbarNoBackShowcase.path);
          },
        ),
      ],
    );
  }
}