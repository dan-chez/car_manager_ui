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
import 'package:flutter/material.dart';

/// The [CMInfoCard] widget displays an icon and a message within a styled container.
/// The card's size can be customized via the [size] parameter, defaulting to 110x120.
/// The [message] text is limited to a single line, truncating with ellipsis if it exceeds
/// the available space.
///
/// Example usage:
/// ```dart
/// CMInfoCard(
///   icon: Icon(Icons.info),
///   message: "Info message",
///   size: Size(120, 130),
/// );
/// ```
class CMInfoCard extends StatelessWidget {
  final Icon icon;
  final String message;
  final Size size;

  const CMInfoCard({
    super.key,
    required this.icon,
    required this.message,
    this.size = const Size(110, 120),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kLightAmaranthPrimary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: kBoxShadowColor,
            offset: Offset(0, 3),
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5),
          Text(
            message,
            style: kContentTextStyle.copyWith(fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
