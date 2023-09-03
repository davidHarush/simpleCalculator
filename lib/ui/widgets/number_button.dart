import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calc/res/styles.dart';

class NumberButton extends StatefulWidget {
  final String label;
  final Function(String) onPressed;

  const NumberButton({super.key, required this.label, required this.onPressed});

  @override
  _NumberButtonState createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () => widget.onPressed(widget.label),
      shape: const CircleBorder(), // Set the shape to circle
      height: 80, // Set the height
      minWidth: 80, // Set the width
      color: Theme.of(context).colorScheme.surfaceVariant, //tertiary
      child: Text(widget.label, style: StylesUtil.numberTextStyle(context)),
    );
  }
}
