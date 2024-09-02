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

import 'package:car_manager_ui/component_model.dart';
import 'package:car_manager_ui/navigation/go_router_provider.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComponentView extends ConsumerWidget {
  final ComponentModel model;

  const ComponentView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(goRouterProvider);
    return Card(
      child: ListTile(
        title: Center(
          child: Text(
            model.description,
            style: kMediumTitleTextStyle,
          ),
        ),
        onTap: () {
          goRouter.push(model.path);
        },
      ),
    );
  }
}
