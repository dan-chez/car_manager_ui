import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [RichTextShowcase] class provides a visual representation of [CMRichText]
/// styles and functionalities within the application.
class RichTextShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/rich_text';

  const RichTextShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMRichText showcase',
      children: [
        createShowcaseTitle(
            'A `RichText` widget in Flutter is a widget that displays a string of text with multiple styles. It allows for complex text layouts with different styles, such as varying fonts, colors, and other text properties within the same block of text.'),
        const Divider(height: 12),
        const CMRichText(text: 'This text is bold|, this isn\'t,| this is', boldPositions: [0, 2])(),
        const Divider(height: 12),
        CMRichText(
          text: 'No part of the text is in bold but all text is red',
          boldPositions: [],
          textStyle: kMediumTitleTextStyle.copyWith(color: Colors.red),
        )(),
        const Divider(height: 12),
        const CMRichText(text: 'All text bold and end align|', boldPositions: [0], textAlign: TextAlign.end)(),
        const Divider(height: 12),
      ],
    );
  }
}
