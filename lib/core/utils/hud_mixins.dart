import 'package:flutter/material.dart';

mixin HudMixins {
  showSnack(BuildContext context, String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      backgroundColor: color,
    ));
  }

  navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  navigateThenUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  navigatePop(BuildContext context) {
    Navigator.pop(context);
  }
}
