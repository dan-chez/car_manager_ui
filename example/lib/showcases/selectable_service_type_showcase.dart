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

/// The [SelectableServiceTypeShowcase] class provides a visual representation of SelectableServiceType
/// styles and functionalities within the application.
class SelectableServiceTypeShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/selectableServiceType';

  const SelectableServiceTypeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'SelectableServiceType showcase',
      children: [
        createShowcaseTitle(
          'SelectableServiceType is a widget that allows you to select a service type from the service type list.',
          higherSize: true,
        ),
        createShowcaseTitle('Basic item list with 2 items.'),
        SelectableServiceType(
          items: const [
            SelectableServiceTypeItem(
              id: '1',
              icon: kTransportServiceImage,
              title: 'Personal service',
              description: 'Exclusive for your transportation and that of your closest circle.',
            ),
            SelectableServiceTypeItem(
              id: '2',
              icon: kTransportServiceImage,
              title: 'Transport service',
              description: 'Transports people or goods for a fee.',
            ),
          ],
          onSelected: (selectedServiceType) {
            showCustomSnackBar(context, onSelectedServiceTypeSnackBar(selectedServiceType));
          },
        ),
        createShowcaseTitle('Basic item list with 3 items.'),
        SelectableServiceType(
          items: const [
            SelectableServiceTypeItem(
              id: '1',
              icon: kTransportServiceImage,
              title: 'Personal service',
              description: 'Exclusive for your transportation and that of your closest circle.',
            ),
            SelectableServiceTypeItem(
              id: '2',
              icon: kTransportServiceImage,
              title: 'Transport service',
              description: 'Transports people or goods for a fee.',
            ),
            SelectableServiceTypeItem(
              id: '3',
              icon: kTransportServiceImage,
              title: 'Exclusive service',
              description: 'Exclusive for bikes.',
            ),
          ],
          onSelected: (selectedServiceType) {
            showCustomSnackBar(context, onSelectedServiceTypeSnackBar(selectedServiceType));
          },
        ),
        createShowcaseTitle('Basic item list with 2 items and long title and description.'),
        SelectableServiceType(
          items: const [
            SelectableServiceTypeItem(
              id: '1',
              icon: kTransportServiceImage,
              title: 'Personal service',
              description:
                  'Exclusive for your transportation and that of your closest circle with long long long description that should has ellipsis at the end.',
            ),
            SelectableServiceTypeItem(
              id: '2',
              icon: kTransportServiceImage,
              title: 'Transport service is a long long long title that should has ellipsis at the end.',
              description: 'Transports people or goods for a fee.',
            ),
          ],
          onSelected: (selectedServiceType) {
            showCustomSnackBar(context, onSelectedServiceTypeSnackBar(selectedServiceType));
          },
        ),
      ],
    );
  }

  SnackBar onSelectedServiceTypeSnackBar(String selectedServiceType) => SnackBar(
        content: Text('Selected service type: $selectedServiceType'),
        duration: const Duration(seconds: 2),
      );
}
