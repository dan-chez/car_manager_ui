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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// The [DropdownShowcase] class provides a visual representation of [CMDropdown]
class DropdownShowcase extends StatelessWidget {
  /// This path is used to navigate to the textField showcase using GoRouter.
  static String path = '/dropdown';

  const DropdownShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMDropdown showcase',
      children: [
        createShowcaseTitle('CMDropdown', higherSize: true),
        createShowcaseTitle('CMDropdown enabled with list of 3 items, hint and label text.'),
        CMDropdown(
          items: const {
            'key0': 'Value0',
            'key1': 'Value1',
            'key2': 'Value2',
          },
          labelText: 'This is label',
          hintText: 'This is a hint',
          disabledHintText: '',
          onItemSelected: _print,
        ),
        createShowcaseTitle('CMDropdown enabled with long list of items, hint and label text.'),
        CMDropdown(
          items: const {
            'key0': 'Value0',
            'key1': 'Value1',
            'key2': 'Value2',
            'key3': 'Value3',
            'key4': 'Value4',
            'key5': 'Value5',
            'key6': 'Value6',
            'key7': 'Value7',
            'key8': 'Value8',
            'key9': 'Value9',
            'key10': 'Value10',
            'key11': 'Value11',
            'key12': 'Value12',
            'key13': 'Value13',
            'key14': 'Value14',
            'key15': 'Value15',
            'key16': 'Value16',
            'key17': 'Value17',
            'key18': 'Value18',
            'key19': 'Value19',
            'key20': 'Value20',
          },
          labelText: 'This is label',
          hintText: 'This is a hint',
          disabledHintText: '',
          onItemSelected: _print,
        ),
        createShowcaseTitle('CMDropdown disabled with disabled hint and label text.'),
        CMDropdown(
          items: const {},
          labelText: 'This is label',
          hintText: 'This is a hint',
          disabledHintText: 'This is disabled hint text',
          onItemSelected: _print,
        ),
      ],
    );
  }

  void _print(String? value, String? key) {
    if (kDebugMode) {
      print('Value: $value, Key: $key');
    }
  }
}
