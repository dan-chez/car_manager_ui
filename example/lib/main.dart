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
