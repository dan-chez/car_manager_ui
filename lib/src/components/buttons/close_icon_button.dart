import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:flutter/material.dart';

/// Use this IconButton for each dialog for close button. It already has custom size to improve click area
class CloseIconButton extends StatelessWidget {
  const CloseIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        constraints: const BoxConstraints(
          minHeight: 0,
        ),
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        onPressed: () => Navigator.pop(context),
        icon: kCloseIcon,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
  }
}
