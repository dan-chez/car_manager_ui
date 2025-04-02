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

class SelectableServiceTypeItem {
  /// Unique identifier for the service type option.
  final String id;

  /// Path or asset name of the service type icon.
  final String icon;

  /// Title label for the service type option.
  final String title;

  /// Descriptive label for the service type option.
  final String description;

  const SelectableServiceTypeItem({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
  });
}
