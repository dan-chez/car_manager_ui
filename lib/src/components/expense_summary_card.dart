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
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:flutter/material.dart';

/// The [ExpenseSummaryCard] widget represents an item with a [description] and [value].
/// It includes an optional delete icon, which is displayed when [onDeletePressed] is provided.
/// The [onDeletePressed] callback is triggered when the delete icon is tapped.
///
/// Example usage:
/// ```dart
/// ExpenseSummaryCard(
///   description: 'Office Supplies',
///   value: '500000',
///   onDeletePressed: () {
///     // Handle delete action
///   },
/// )
/// ```
class ExpenseSummaryCard extends StatelessWidget {
  final String description;
  final String value;
  final void Function()? onDeletePressed;

  const ExpenseSummaryCard({
    super.key,
    required this.description,
    required this.value,
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
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                description,
                style: kContentTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kkMyrtleGreenWithOpacity,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 14),
            Text(
              value,
              style: kContentTextStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: kkMyrtleGreenWithOpacity,
              ),
            ),
            Visibility(
              visible: onDeletePressed != null,
              replacement: const SizedBox(height: 47),
              child: _getDeleteSection(),
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
