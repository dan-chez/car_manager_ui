import 'package:car_manager_ui/constants/image_constants.dart';
import 'package:car_manager_ui/main.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CmAppbarNoBackShowcase extends StatelessWidget {

  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/cmAppbarNoBack';
  const CmAppbarNoBackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMAppbar(
        assetName: kCarManagerFullLogoImage,
      ),
      body: Center(
        child: PrimaryButton(
          txtLabel: 'Go back to Home',
          onPressed: () {
            context.go(MyHomePage.path);
          },
        ),
      ),
    );
  }
}
