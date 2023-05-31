import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget webScreen;

  const ResponsiveLayout({required this.mobileScreen, required this.webScreen})
      : super();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constriant) {
      if (constriant.maxWidth >= 900) {
        return webScreen;
      }
      return mobileScreen;
    });
  }
}
