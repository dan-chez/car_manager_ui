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
import 'package:carmanager_ui/src/utils/extensions/number_extensions.dart';
import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

/// The [CMSummaryCard] widget displays a summary card containing a [text] description
/// and a [profit] value. The card includes a styled title with an optional profit/loss
/// indication. The color of the profit text changes based on whether the value represents
/// a profit (green) or a loss (amaranth).
///
/// Example usage:
/// ```dart
/// CMSummaryCard(
///   text: 'Total Revenue',
///   profit: '500000',
/// )
/// ```
/// The card adjusts its layout to fit the available width and ensures clear visibility
/// of the profit/loss value with appropriate styling.
class CMSummaryCard extends StatelessWidget {
  final String text;
  final String profit;

  const CMSummaryCard({
    super.key,
    required this.text,
    required this.profit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: kContentTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: kkMyrtleGreenWithOpacity,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                color: kCanyonBronze.withOpacity(0.17),
                blurRadius: 3,
              ),
            ],
            color: kWhite,
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Text(
            profit.toMoneyFormat,
            textAlign: TextAlign.center,
            style: kTitleTextStyle.copyWith(
              color: profit.parseToInt.isProfit ? kGreen : kAmaranthPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
