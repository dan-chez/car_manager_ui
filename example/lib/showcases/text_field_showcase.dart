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

/// The [TextFieldShowcase] class provides a visual representation of various textField
/// styles and functionalities within the application.
class TextFieldShowcase extends StatelessWidget {
  /// This path is used to navigate to the textField showcase using GoRouter.
  static String path = '/textField';

  const TextFieldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'TextField showcase',
      children: [
        createShowcaseTitle('CMTextField', higherSize: true),
        createShowcaseTitle('Can\'t be empty, capitalize first letter of each word, support any input'),
        const CMTextField(
          hintText: 'Get value',
          onTextChange: printValue,
          errorText: 'This can\'t be empty',
          textCapitalization: TextCapitalization.words,
        ),
        createShowcaseTitle('Can\'t be empty, capitalize first letter of each word, support any input, initial value'),
        const CMTextField(
          hintText: 'Custom hint',
          onTextChange: printValue,
          errorText: 'This can\'t be empty',
          textCapitalization: TextCapitalization.words,
          initialValue: 'Custom initial value',
        ),
        createShowcaseTitle('Can be empty, support any input, initial value'),
        const CMTextField(
          hintText: 'Custom hint',
          onTextChange: printValue,
          canBeEmpty: true,
          errorText: 'This can\'t be empty',
          initialValue: 'Custom initial value',
        ),
        createShowcaseTitle('Can be empty, numbers input'),
        const CMTextField(
          hintText: 'Custom hint',
          onTextChange: printValue,
          canBeEmpty: true,
          textInputType: TextInputType.number,
        ),
        createShowcaseTitle('CMMultilineTextField', higherSize: true),
        createShowcaseTitle('Can be empty, maxLength 100'),
        const CMMultilineTextField(
          onTextChange: printValue,
          maxLength: 100,
        ),
        createShowcaseTitle('Can\'t be empty, initial value'),
        const CMMultilineTextField(
          onTextChange: printValue,
          canBeEmpty: false,
          initialValue: 'This is a initial value',
          errorText: 'This can\'t be empty',
        ),
        createShowcaseTitle('CMMoneyTextField', higherSize: true),
        createShowcaseTitle('Can be empty'),
        const CMMoneyTextField(
          hintText: 'Income',
          onTextChange: printValue,
          canBeEmpty: true,
        ),
        createShowcaseTitle('Can\'t be empty'),
        const CMMoneyTextField(
          hintText: 'Income',
          onTextChange: printValue,
          canBeEmpty: false,
          errorText: 'This can\'t be empty',
        ),
        createShowcaseTitle('Disabled'),
        const CMMoneyTextField(
          hintText: 'Income',
          onTextChange: printValue,
          canBeEmpty: false,
          isEnabled: false,
        ),
      ],
    );
  }
}
