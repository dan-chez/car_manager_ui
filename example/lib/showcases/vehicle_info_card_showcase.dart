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
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [VehicleInfoCardShowcase] class demonstrates different configurations and use cases
/// of the [VehicleInfoCard] widget, providing a visual representation of its behavior within
/// the application.
class VehicleInfoCardShowcase extends StatelessWidget {
  static String path = '/vehicleInfoCard';

  const VehicleInfoCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onDeleteSnackBar = SnackBar(
      content: Text('onDelete pressed'),
    );
    const onEditSnackBar = SnackBar(
      content: Text('onEdit pressed'),
    );

    return ShowcaseAppBase(
      title: 'Vehicle info card showcase',
      children: [
        createShowcaseTitle('Basic Configuration - Displays essential vehicle details in a non-interactive format.'),
        VehicleInfoCard(
          type: VehicleInfoCardType.nonSelectable,
          name: 'Batmobile',
          plate: 'Placa:|ABC123',
          kms: '40.000|KM',
          vehicleType: 'Transport Service',
          onDeletePressed: () => showCustomSnackBar(context, onDeleteSnackBar),
          onEditPressed: () => showCustomSnackBar(context, onEditSnackBar),
        ),
        createShowcaseTitle('Selectable Card - Allows to toggle additional details dynamically.'),
        VehicleInfoCard(
          type: VehicleInfoCardType.selectable,
          name: 'Lamborghini Aventador',
          plate: 'Placa:|XYZ789',
          kms: '50.000|KM',
          vehicleType: 'Luxury Sports Car',
          onDeletePressed: () => showCustomSnackBar(context, onDeleteSnackBar),
          onEditPressed: () => showCustomSnackBar(context, onEditSnackBar),
        ),
        createShowcaseTitle('Non-Selectable Card - Always expanded with all details visible.'),
        VehicleInfoCard(
          type: VehicleInfoCardType.nonSelectable,
          name: 'Tesla Model S',
          plate: 'Placa:|EV2024',
          kms: '15.000|KM',
          vehicleType: 'Electric Vehicle',
          onDeletePressed: () => showCustomSnackBar(context, onDeleteSnackBar),
          onEditPressed: () => showCustomSnackBar(context, onEditSnackBar),
        ),
        createShowcaseTitle('Selectable Card - Initially disabled, allowing users to enable details on demand.'),
        VehicleInfoCard(
          type: VehicleInfoCardType.selectable,
          name: 'Ford Mustang',
          plate: 'Placa:|MUSCLE99',
          kms: '80.000|KM',
          vehicleType: 'Classic Muscle Car',
          onDeletePressed: () => showCustomSnackBar(context, onDeleteSnackBar),
          onEditPressed: () => showCustomSnackBar(context, onEditSnackBar),
        ),
      ],
    );
  }
}
