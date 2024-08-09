import 'package:flutter/material.dart';

/// A customizable icon button with optional sizing and tap interaction.
///
/// The [CMIconButton] widget is a simple icon button that allows you to specify an [icon] and an
/// [onPressed] callback. The size of the button can be controlled using the optional [size] property,
/// which sets the width and height of the button.
///
/// Example usage:
/// ```dart
/// CMIconButton(
///   icon: Icon(Icons.add),
///   onPressed: () {
///     print('Icon button pressed');
///   },
///   size: Size(50, 50),
/// );
/// ```
class CMIconButton extends StatelessWidget {
  const CMIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size,
  });

  final VoidCallback? onPressed;
  final Icon icon;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height,
      width: size?.width,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: icon,
      ),
    );
  }
}
