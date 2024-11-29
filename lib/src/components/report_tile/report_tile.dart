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

import 'package:carmanager_ui/src/components/buttons/cm_icon_button.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/button_constants.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/utils/extensions/number_extensions.dart';
import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

/// The [ReportTile] widget allows you to display a report's name [text] and
/// its value [value] in a structured layout. It supports interaction via
/// [onPressed] and optional deletion via [onDelete]. It conditionally displays
/// the delete and edit icons or an arrow based on the [showDeleteAndEditIcon] flag.
///
/// Example usage:
/// ```dart
/// ReportTile(
///   text: 'Monday 19',
///   value: '1500',
///   onPressed: () => print('Pressed'),
///   onDelete: () => print('Delete Pressed'),
/// );
/// ```
class ReportTile extends StatelessWidget {
  final String text;
  final String value;
  final VoidCallback onPressed;
  final VoidCallback? onDelete;
  final bool showDeleteAndEditIcon;

  const ReportTile({
    super.key,
    required this.text,
    required this.value,
    required this.onPressed,
    this.showDeleteAndEditIcon = true,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: kReportTileButtonStyle,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style:
                      kContentTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                value.toMoneyFormat,
                style: kContentTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: value.parseToInt.isProfit ? kGreen : kAmaranthPrimary,
                ),
              ),
              const SizedBox(width: 10),
              Visibility(
                visible: showDeleteAndEditIcon,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VerticalDivider(
                      width: 2,
                      thickness: 1.5,
                      color: kMyrtleGreen,
                      endIndent: 5,
                      indent: 5,
                    ),
                    const SizedBox(width: 10),
                    kEditReportIcon,
                    CMIconButton(
                      size: const Size.square(30),
                      icon: kDeleteIcon,
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
              // If delete and edit icons are hidden, show a forward arrow.
              Visibility(
                visible: !showDeleteAndEditIcon,
                child: kArrowForwardIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
