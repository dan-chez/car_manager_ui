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

import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:carmanager_ui/src/components/cm_rich_text.dart';
import 'package:flutter/material.dart';

/// The [WarningInfo] widget is used to display a dismissible alert message with animation.
///
/// The message supports text segmentation using the pipe (`|`) character. You can specify
/// which segments should appear in bold using the [boldPositions] parameter.
///
/// Example usage:
/// ```dart
/// WarningInfo(
///   message: 'This is|important|information for you.',
///   boldPositions: [1],
///   onDismissed: () {
///     print('Dismissed');
///   },
/// )
/// ```
class WarningInfo extends StatefulWidget {
  final String message;
  final VoidCallback? onDismissed;
  final List<int> boldPositions;

  const WarningInfo({
    super.key,
    required this.message,
    this.onDismissed,
    this.boldPositions = const [],
  });

  @override
  State<WarningInfo> createState() => _WarningInfoState();
}

class _WarningInfoState extends State<WarningInfo> with SingleTickerProviderStateMixin {
  bool _visible = true;
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curve);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.05),
      end: Offset.zero,
    ).animate(curve);

    _controller.forward();
  }

  void _handleDismiss() {
    _controller.reverse().then((_) {
      if (mounted) {
        setState(() => _visible = false);
        widget.onDismissed?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: _handleDismiss,
          child: Container(
            decoration: BoxDecoration(
              color: kAlertLight,
              borderRadius: BorderRadius.circular(CMDimens.d6),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: CMDimens.d8,
                    margin: const EdgeInsets.only(right: CMDimens.d10),
                    decoration: BoxDecoration(
                      color: kAlert,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(CMDimens.d6),
                        bottomLeft: Radius.circular(CMDimens.d6),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: CMDimens.d10),
                      child: Row(
                        children: [
                          kInfoIcon,
                          SizedBox(width: CMDimens.d6),
                          Expanded(
                            child: CMRichText(
                              text: widget.message,
                              textStyle: kContentTextStyle,
                              boldPositions: widget.boldPositions,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            )(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
