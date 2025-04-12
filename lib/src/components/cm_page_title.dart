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

import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/dividers.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

/// A widget that displays a page title with customizable styles and an optional bottom divider.
///
/// The [CMPageTitle] widget is used to create a page title with a combination of light and bold text.
/// It allows you to specify two strings: [lightTitle] and [boldTitle], where the first is styled with
/// a lighter font weight and the second with a bolder font weight. Also, you can control the
/// visibility of a bottom divider using the [showBottomDivider] property. Additionally yo can show
/// an edit icon on the right of the [boldTitle].
///
/// This widget is useful for displaying section headers or titles in a consistent manner, with the
/// ability to adjust text styles and layout.
///
/// Example usage:
/// ```dart
/// CMPageTitle(
///   lightTitle: "Welcome to",
///   boldTitle: "Flutter",
///   showBottomDivider: true,
/// );
/// ```
class CMPageTitle extends StatelessWidget {
  final String lightTitle;
  final String boldTitle;
  final bool showBottomDivider;
  final bool showEditIcon;

  const CMPageTitle({
    super.key,
    required this.lightTitle,
    required this.boldTitle,
    this.showBottomDivider = true,
    this.showEditIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lightTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  boldTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Visibility(
                visible: showEditIcon,
                child: Padding(
                  padding: const EdgeInsets.only(left: CMDimens.d8),
                  child: kEditIcon,
                ),
              ),
            ],
          ),
          Visibility(
            visible: showBottomDivider,
            child: kPrimaryDivider,
          ),
        ],
      ),
    );
  }
}
