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

/// The [SelectableVehicleShowcase] class provides a visual representation of SelectableVehicleType
/// styles and functionalities within the application.
class SelectableVehicleTypeShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/selectableVehicle';

  const SelectableVehicleTypeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'SelectableVehicleType showcase',
      children: [
        createShowcaseTitle(
          'SelectableVehicleType is a widget that allows you to select a vehicle type from the vehicle list.',
          higherSize: true,
        ),
        createShowcaseTitle('Basic item list with 2 items.'),
        SelectableVehicleType(
          items: const [
            SelectableVehicleTypeItem(
                id: '1', icon: kSelectableCarImage, description: 'Car'),
            SelectableVehicleTypeItem(
                id: '2', icon: kSelectableBikeImage, description: 'Bike'),
          ],
          onSelected: (selectedVehicle) {
            showCustomSnackBar(
                context, onSelectedVehicleSnackBar(selectedVehicle));
          },
        ),
        createShowcaseTitle(
            'Basic item list with 2 items and initial selection.'),
        SelectableVehicleType(
          items: const [
            SelectableVehicleTypeItem(
                id: '1', icon: kSelectableCarImage, description: 'Car'),
            SelectableVehicleTypeItem(
                id: '2', icon: kSelectableBikeImage, description: 'Bike'),
          ],
          onSelected: (selectedVehicle) {
            showCustomSnackBar(
                context, onSelectedVehicleSnackBar(selectedVehicle));
          },
          initialSelection: '2',
        ),
        createShowcaseTitle(
            'Basic item list with 2 items and long descriptions.'),
        SelectableVehicleType(
          items: const [
            SelectableVehicleTypeItem(
                id: '1',
                icon: kSelectableCarImage,
                description: 'This is a long car description.'),
            SelectableVehicleTypeItem(
                id: '2', icon: kSelectableBikeImage, description: 'Bike'),
          ],
          onSelected: (selectedVehicle) {
            showCustomSnackBar(
                context, onSelectedVehicleSnackBar(selectedVehicle));
          },
        ),
        createShowcaseTitle('Basic item list with 3 items.'),
        SelectableVehicleType(
          items: const [
            SelectableVehicleTypeItem(
                id: '1', icon: kSelectableCarImage, description: 'Car'),
            SelectableVehicleTypeItem(
                id: '2', icon: kSelectableBikeImage, description: 'Bike'),
            SelectableVehicleTypeItem(
                id: '3', icon: kSelectableCarImage, description: 'Bus'),
          ],
          onSelected: (selectedVehicle) {
            showCustomSnackBar(
                context, onSelectedVehicleSnackBar(selectedVehicle));
          },
        )
      ],
    );
  }

  SnackBar onSelectedVehicleSnackBar(String selectedVehicle) => SnackBar(
        content: Text('Selected vehicle: $selectedVehicle'),
        duration: const Duration(seconds: 2),
      );
}
