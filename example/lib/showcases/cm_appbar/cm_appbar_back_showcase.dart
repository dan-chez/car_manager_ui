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
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

class CMAppbarBackShowcase extends StatelessWidget {
  /// This path is used to navigate to the CMAppBar showcase with back button using GoRouter.
  static String path = '/cmAppbarBack';
  const CMAppbarBackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CMAppbar(
        assetName: kCarManagerFullLogoImage,
      ),
    );
  }
}
