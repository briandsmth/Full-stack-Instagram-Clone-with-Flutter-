import 'package:flutter/material.dart';
import 'package:instafire_flutter/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webscreenLayout;
  final Widget mobilescreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webscreenLayout,
      required this.mobilescreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webscreensize) {
          return webscreenLayout;
        }
        return mobilescreenLayout;
      },
    );
  }
}
