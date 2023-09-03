import 'package:flutter/material.dart';

class StylesUtil {
  static Brightness getBrightness(BuildContext context) {
    Color bgColor = outputBackGroundColor(context);
    double luminance = bgColor.computeLuminance();

    print('Background color: $bgColor');
    print('Computed luminance: $luminance');

    if (luminance > 0.5) {
      print('Setting Brightness to dark');
      return Brightness.dark; // Light color, use dark color icons
    } else {
      print('Setting Brightness to light');
      return Brightness.light; // Dark color, use light color icons
    }
  }

  static Color outputBackGroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surfaceVariant;
  }

  static Color outputTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurfaceVariant; //onTertiaryContainer
  }

  static TextStyle operationTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 36.0,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }

  static Color operationBackGroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static TextStyle numberTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 36.0,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}
