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

import 'package:car_manager_ui/component_view.dart';
import 'package:car_manager_ui/components_showcases.dart';
import 'package:car_manager_ui/navigation/go_router_provider.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ExampleApp(),
    ),
  );
}

class ExampleApp extends ConsumerWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: kMyrtleGreen),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}

class MyHomePage extends StatelessWidget {
  static String path = '/home';

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ScrollConfiguration(
          behavior: CMScrollBehavior(),
          child: ListView(
            shrinkWrap: true,
            children: components.map((component) {
              return ComponentView(
                model: component,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
