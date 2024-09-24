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

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// A stateless widget that serves as a base structure for a screen with a customizable title.
///
/// The [ShowcaseAppBase] widget uses a [Scaffold] to create a standard page layout
/// that includes an [AppBar] with a title. The background color of the [AppBar] is
/// dynamically set based on the current theme's color scheme. This class can be used
/// as a base for screens that need a consistent app bar layout across the application.
///
/// Example usage:
/// ```dart
/// ShowcaseAppBase(title: 'TextField showcase', children: [...]);
/// ```
class ShowcaseAppBase extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ShowcaseAppBase({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ScrollConfiguration(
        behavior: CMScrollBehavior(),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: children,
        ),
      ),
    );
  }
}
