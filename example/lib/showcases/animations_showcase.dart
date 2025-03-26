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

import 'package:car_manager_ui/constants/image_constants.dart';
import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

class AnimationsShowcase extends StatelessWidget {
  /// This path is used to navigate to the animations showcase using GoRouter.
  static String path = '/animations';

  const AnimationsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(title: 'CMBriefCard showcase', children: [
      createShowcaseTitle('Animation with default configurations'),
      const CMAnimation(kLoadingAnimation),
      createShowcaseTitle(
          'Animation with animate in false (the animation does not start automatically) and custom width and height'),
      const CMAnimation(
        kLoadingAnimation,
        animate: false,
        width: CMDimens.d180,
        height: CMDimens.d180,
      ),
      createShowcaseTitle(
          'Animation with repeat in false (the animation plays only once) and custom width and height'),
      const CMAnimation(
        kLoadingAnimation,
        repeat: false,
        width: CMDimens.d180,
        height: CMDimens.d180,
      ),
      createShowcaseTitle(
          'Animation with custom width and height and reversed'),
      const CMAnimation(
        kLoadingAnimation,
        width: CMDimens.d180,
        height: CMDimens.d180,
        reverse: true,
      ),
    ]);
  }
}
