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

/// The [ReportTileShowcase] class provides a visual representation of [ReportTile].
class ReportTileShowcase extends StatelessWidget {
  /// This path is used to navigate to the ReportTile showcase using GoRouter.
  static String path = '/reportTile';

  const ReportTileShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onDeleteSnackBar = SnackBar(
      content: Text('onDelete pressed'),
    );
    const onPressedSnackBar = SnackBar(
      content: Text('onPressed pressed'),
    );
    return ShowcaseAppBase(
      title: 'ReportTile showcase',
      children: [
        createShowcaseTitle('Date description, positive value, edit and delete icon'),
        ReportTile(
          text: 'Monday 19',
          value: '13366',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
          onDelete: () => showCustomSnackBar(context, onDeleteSnackBar),
        ),
        createShowcaseTitle('Date description, negative value, edit and delete icon'),
        ReportTile(
          text: 'Monday 19',
          value: '-13366',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
          onDelete: () => showCustomSnackBar(context, onDeleteSnackBar),
        ),
        createShowcaseTitle('Date description, positive value'),
        ReportTile(
          text: 'Monday 19',
          value: '13366',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
          showDeleteAndEditIcon: false,
        ),
        createShowcaseTitle('Date description, negative value'),
        ReportTile(
          text: 'Monday 19',
          value: '-13366',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
          showDeleteAndEditIcon: false,
        ),
        createShowcaseTitle('Two tiles with date description, negative value'),
        ReportTile(
          text: 'Monday 19',
          value: '-13366',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
          showDeleteAndEditIcon: false,
        ),
        ReportTile(
          text: 'Monday 18',
          value: '256852',
          onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
          showDeleteAndEditIcon: false,
        ),
      ],
    );
  }
}
