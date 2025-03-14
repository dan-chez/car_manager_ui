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

import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_item_data.dart';

class CarPickerDialogData {
  final String title;
  final String buttonText;
  final List<CarPickerItemData> items;
  final String? selectedId;
  final Function(String?) onItemSelected;
  final Function onButtonPressed;

  const CarPickerDialogData({
    required this.title,
    required this.buttonText,
    required this.items,
    this.selectedId,
    required this.onItemSelected,
    required this.onButtonPressed,
  });
}
