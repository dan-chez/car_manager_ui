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

/// The [CurrentVehicleCardShowcase] class demonstrates different configurations and use cases
/// of the [CurrentVehicleCard] widget, providing a visual representation of its behavior within
/// the application.
class CurrentVehicleCardShowcase extends StatelessWidget {
  static String path = '/currentVehicleCard';

  const CurrentVehicleCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onPressedSnackBar = SnackBar(
      content: Text('Current vehicle card pressed'),
    );

    return ShowcaseAppBase(
      title: 'Current vehicle card showcase',
      children: [
        createShowcaseTitle(
          'Basic configuration - Standard vehicle details display.',
        ),
        CurrentVehicleCard(
          vehicleName: 'Chevrolet Spark GT',
          vehiclePlate: 'Plate:|ABC123',
          plateBoldPositions: const [1],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Long name example'),
        CurrentVehicleCard(
          vehicleName:
              'Chevrolet Spark Grand Turismo Edition with Extended Name for Overflow Testing',
          vehiclePlate: 'Plate:|LONGPLATE987654321',
          plateBoldPositions: const [1],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Extended plate example'),
        CurrentVehicleCard(
          vehicleName: 'Ford Focus',
          vehiclePlate: 'Plate:|EXTREMELYLONGPLATENUMBER12345',
          plateBoldPositions: const [0],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('No bold positions'),
        CurrentVehicleCard(
          vehicleName: 'Tesla Model 3',
          vehiclePlate: 'Plate:|TESLA3',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('With label'),
        CurrentVehicleCard(
          vehicleName: 'Tesla Model 4',
          vehiclePlate: 'Plate:|TES421',
          label: 'Current vehicle',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
      ],
    );
  }
}
