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

/// The [CMSelectableCardShowcase] class demonstrates different configurations and use cases
/// of the [CMSelectableCard] widget, providing a visual representation of its behavior within
/// the application.
class CMSelectableCardShowcase extends StatelessWidget {
  static String path = '/cmSelectableCard';

  const CMSelectableCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onPressedSnackBar = SnackBar(
      content: Text('Selectable card pressed'),
    );

    return ShowcaseAppBase(
      title: 'CMSelectableCard showcase',
      children: [
        createShowcaseTitle('Basic configuration - Title only'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title: 'Chevrolet Spark GT',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('With subtitle'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title: 'Chevrolet Spark GT',
          subtitle: 'Plate:|ABC123',
          subtitleBoldPositions: const [1],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Title without uppercase'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title: 'Chevrolet Spark GT',
          titleUpperCase: false,
          subtitle: 'Plate:|ABC123',
          subtitleBoldPositions: const [1],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Long title example'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title:
          'Chevrolet Spark Grand Turismo Edition with Extended Name for Overflow Testing',
          subtitle: 'Plate:|LONGPLATE987654321',
          subtitleBoldPositions: const [1],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Extended subtitle example'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title: 'Ford Focus',
          subtitle: 'Plate:|EXTREMELYLONGPLATENUMBER12345',
          subtitleBoldPositions: const [0],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('No bold positions in subtitle'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title: 'Tesla Model 3',
          subtitle: 'Plate:|TESLA3',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('With floating label'),
        CMSelectableCard(
          leadingIcon: kCheckIconRed,
          title: 'Tesla Model 4',
          subtitle: 'Plate:|TES421',
          floatingLabel: 'Current vehicle',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Custom leading icon'),
        CMSelectableCard(
          leadingIcon: const Icon(Icons.directions_car, color: Colors.blue),
          title: 'Honda Civic',
          subtitle: 'Plate:|HONDA123',
          subtitleBoldPositions: const [1],
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Full configuration with uppercase'),
        CMSelectableCard(
          leadingIcon: const Icon(Icons.electric_car, color: Colors.green),
          title: 'BMW i4',
          subtitle: 'Plate:|ELEC2024',
          subtitleBoldPositions: const [1],
          floatingLabel: 'Selected vehicle',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
        createShowcaseTitle('Full configuration without uppercase'),
        CMSelectableCard(
          leadingIcon: const Icon(Icons.electric_car, color: Colors.green),
          title: 'BMW i4 eDrive40',
          titleUpperCase: false,
          subtitle: 'Plate:|ELEC2024',
          subtitleBoldPositions: const [1],
          floatingLabel: 'Selected vehicle',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
        ),
      ],
    );
  }
}