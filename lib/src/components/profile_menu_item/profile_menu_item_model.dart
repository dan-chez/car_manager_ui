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

import 'package:flutter/material.dart' show Icon, VoidCallback;

/// A data model that represents a single item in a user profile menu.
///
/// The [ProfileMenuItemModel] defines the structure of a profile-related action,
/// containing the visual icon, the text label, and the behavior when tapped.
class ProfileMenuItemModel {
  final String content;
  final VoidCallback onPressed;
  final Icon icon;
  final int maxLines;

  const ProfileMenuItemModel({
    required this.content,
    required this.onPressed,
    required this.icon,
    this.maxLines = 1,
  });
}
