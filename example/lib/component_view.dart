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
