import 'package:car_manager_ui/main.dart';
import 'package:car_manager_ui/showcases/button_showcase.dart';
import 'package:car_manager_ui/showcases/dialogs_showcase.dart';
import 'package:car_manager_ui/showcases/rich_text_showcase.dart';
import 'package:car_manager_ui/showcases/text_field_showcase.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'appNavigatorKey');

/// A Riverpod provider for GoRouter, providing an instance of GoRouter
/// configured through the GoRouterHelper class.
final goRouterProvider = Provider<GoRouter>((_) => GoRouterHelper().router);

/// A helper class to configure and manage GoRouter instance.
/// This class follows the Singleton pattern to ensure only one instance
/// of the router is created.
class GoRouterHelper {
  static final GoRouterHelper _instance = GoRouterHelper._internal();

  factory GoRouterHelper() => _instance;

  late final GoRouter router;

  GoRouterHelper._internal() {
    // All component screens must be added here
    var routes = [
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: MyHomePage.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const MyHomePage(title: 'Sample widget app'),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ButtonShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ButtonShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: TextFieldShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const TextFieldShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: RichTextShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const RichTextShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: DialogsShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const DialogsShowcase(),
            state: state,
          );
        },
      ),
      // Dialog routes
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ConfirmDialogRoute.path,
        pageBuilder: (context, state) =>
            ConfirmDialogRoute.createRoute(context, state, dialogData: state.extra as ConfirmDialogData),
      ),
    ];
    router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _appNavigatorKey,
      initialLocation: MyHomePage.path,
      routes: routes,
    );
  }

  Page _getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
