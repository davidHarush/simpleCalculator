import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:simple_calc/res/styles.dart';
import 'package:simple_calc/ui/screens/calculator_screen.dart';

import 'ui/logic/calculator_helper.dart';
import 'ui/widgets/delete_button.dart';
import 'ui/widgets/equal_button.dart';
import 'ui/widgets/number_button.dart';
import 'ui/widgets/operation_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightDynamic ?? const ColorScheme.light(),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic ?? const ColorScheme.dark(),
            useMaterial3: true,
          ),
          home: const CalculatorScreen(),
        );
      },
    );
  }
}
