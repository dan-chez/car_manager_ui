import 'package:car_manager_ui/constants/image_constants.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

class CmAppbarBackShowcase extends StatelessWidget {

  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/cmAppbarBack';
  const CmAppbarBackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CMAppbar(
        assetName: kCarManagerFullLogoImage,
      ),
    );
  }
}
