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

import 'package:carmanager_ui/src/components/selectable_service_type/selectable_service_type_item.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';
import 'package:carmanager_ui/src/constants/string_constants.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays a vertical selectable list of service types.
/// Each service type is represented by an icon, title and a description.
///
/// When a service type is selected, the widget highlights it and triggers the [onSelected] callback.
///
/// Example usage:
/// ```dart
/// SelectableServiceType(
///   items: const [
///     SelectableServiceTypeItem(id: '1', icon: 'car.svg', title: 'Title', description: 'Car'),
///     SelectableServiceTypeItem(id: '2', icon: 'bike.svg', title: 'Title', description: 'Bike'),
///   ],
///   onSelected: (selectedServiceType) {
///     print('Selected service type: $selectedServiceType');
///   },
/// )
/// ```
class SelectableServiceType extends StatefulWidget {
  /// The list of available service type options.
  final List<SelectableServiceTypeItem> items;

  /// Callback triggered when a service type is selected, returning the selected service type's ID.
  final ValueChanged<String> onSelected;

  const SelectableServiceType({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  State<SelectableServiceType> createState() => _SelectableServiceTypeState();
}

class _SelectableServiceTypeState extends State<SelectableServiceType> {
  static const double _iconSize = CMDimens.d24;

  String? selectedId;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          spacing: CMDimens.d16,
          children: widget.items.map((item) {
            final isSelected = item.id == selectedId;

            final isDescWrap = willTextWrap(
                text: item.description, maxWidth: constraints.maxWidth);

            return GestureDetector(
              onTap: () {
                setState(() => selectedId = item.id);
                widget.onSelected(item.id);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                      color: kBoxShadowColor,
                      blurRadius: CMDimens.d4,
                      offset: Offset(CMDimens.d0, CMDimens.d5),
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(CMDimens.d6),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isSelected ? kMyrtleGreen : kPrimaryColorWithOpacityBG,
                    borderRadius: BorderRadius.all(
                      Radius.circular(CMDimens.d6),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(CMDimens.d16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          item.icon,
                          colorFilter: ColorFilter.mode(
                            isSelected ? kWhite : kAmaranthPrimary,
                            BlendMode.srcIn,
                          ),
                          width: _iconSize,
                          height: _iconSize,
                        ),
                        const SizedBox(width: CMDimens.d12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kCMButtonTextStyle.copyWith(
                                        color:
                                            isSelected ? kWhite : kMyrtleGreen,
                                      ),
                                    ),
                                  ),
                                  if (isSelected) kCheckIcon,
                                ],
                              ),
                              const SizedBox(height: CMDimens.d4),
                              Text(
                                item.description +
                                    (isDescWrap
                                        ? StringConstants.empty
                                        : StringConstants.lineBreak),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: kCaptionTextStyle.copyWith(
                                  color: isSelected ? kWhite : kMyrtleGreen,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  bool willTextWrap({
    required String text,
    required double maxWidth,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: kCaptionTextStyle.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
      maxLines: null,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }
}
