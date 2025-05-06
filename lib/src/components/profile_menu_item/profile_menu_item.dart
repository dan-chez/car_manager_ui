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

import 'package:carmanager_ui/src/components/profile_menu_item/profile_menu_item_model.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';

/// The [ProfileMenuItem] widget presents a tappable row containing an icon, text label, and a trailing arrow.
/// It is often used in profile screens to trigger navigation or display related options.
///
/// Example usage:
/// ```dart
/// ProfileMenuItem(
///   item: ProfileMenuItemModel(
///     content: 'Settings',
///     onPressed: () => print('Settings pressed'),
///     icon: Icon(Icons.settings),
///   ),
/// )
/// ```
class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.item,
  });

  final ProfileMenuItemModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onPressed,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          CMDimens.d12,
          CMDimens.d12,
          CMDimens.d18,
          CMDimens.d12,
        ),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(CMDimens.d4),
          boxShadow: [
            BoxShadow(
              color: kBoxShadowColor,
              blurRadius: CMDimens.d4,
              offset: const Offset(CMDimens.d0, CMDimens.d2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          spacing: CMDimens.d10,
          children: [
            item.icon,
            Expanded(
              child: Text(
                item.content,
                style: kContentTextStyle.copyWith(fontWeight: FontWeight.w400),
                maxLines: item.maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            kArrowForwardIcon,
          ],
        ),
      ),
    );
  }
}
