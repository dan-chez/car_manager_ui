import 'package:carmanager_ui/src/constants/dividers.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

/// A widget that displays a page title with customizable styles and an optional bottom divider.
///
/// The [CMPageTitle] widget is used to create a page title with a combination of light and bold text.
/// It allows you to specify two strings: [lightTitle] and [boldTitle], where the first is styled with
/// a lighter font weight and the second with a bolder font weight. Additionally, you can control the
/// visibility of a bottom divider using the [showBottomDivider] property.
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

  const CMPageTitle({
    super.key,
    required this.lightTitle,
    required this.boldTitle,
    this.showBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            lightTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w300),
          ),
          Text(
            boldTitle,
            style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w600),
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
