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

import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:flutter/material.dart';

/// The [CMExpenseSummaryCard] widget represents an item with a [description] and [value].
/// It optionally includes a delete icon, which can be enabled using the [showDeleteIcon] parameter.
/// When the delete icon is pressed, the [onDeletePressed] callback is triggered.
///
/// Example usage:
/// ```dart
/// CMExpenseSummaryCard(
///   description: 'Office Supplies',
///   value: '500000',
///   showDeleteIcon: true,
///   onDeletePressed: () {
///     // Handle delete action
///   },
/// )
/// ```
class CMExpenseSummaryCard extends StatelessWidget {
  final String description;
  final String value;
  final bool showDeleteIcon;
  final void Function()? onDeletePressed;

  const CMExpenseSummaryCard({
    super.key,
    required this.description,
    required this.value,
    this.showDeleteIcon = false,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kExpenseSummaryCardBg,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Text(
                description,
                style: kContentTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kkMyrtleGreenWithOpacity,
                ),
              ),
            ),
            Text(
              value,
              style: kContentTextStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: kkMyrtleGreenWithOpacity,
              ),
            ),
            if (showDeleteIcon)
              _getDeleteSection()
            else
              const SizedBox(
                height: 47,
                width: 14,
              )
          ],
        ),
      ),
    );
  }

  Widget _getDeleteSection() {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        const VerticalDivider(
          width: 2,
          thickness: 1.5,
          color: kAmaranthPrimary,
          endIndent: 5,
          indent: 5,
        ),
        IconButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          onPressed: onDeletePressed,
          icon: kDeleteIcon,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ],
    );
  }
}
