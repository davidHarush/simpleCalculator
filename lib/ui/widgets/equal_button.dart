import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calc/res/styles.dart';

class EqualButton extends StatefulWidget {
  final Function(String) onPressed;

  const EqualButton({super.key, required this.onPressed});

  @override
  _EqualButtonState createState() => _EqualButtonState();
}

class _EqualButtonState extends State<EqualButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () => widget.onPressed('='),
      shape: const CircleBorder(), // Set the shape to circle
      height: 80, // Set the height
      minWidth: 80, // Set the width
      color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.7),
      child: Text(
        '=',
        style: StylesUtil.operationTextStyle(context).copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
      ),
    );
  }
}
