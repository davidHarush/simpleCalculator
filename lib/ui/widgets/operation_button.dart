import 'package:flutter/material.dart';
import 'package:simple_calc/res/styles.dart';

class OperationButton extends StatefulWidget {
  final String label;
  final Function(String) onPressed;

  const OperationButton({super.key, required this.label, required this.onPressed});

  @override
  _OperationButtonState createState() => _OperationButtonState();
}

class _OperationButtonState extends State<OperationButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () => widget.onPressed(widget.label),
      shape: const CircleBorder(), // Set the shape to circle
      height: 80, // Set the height
      minWidth: 80, // Set the width
      color: StylesUtil.operationBackGroundColor(context),
      child: Text(
        widget.label,
        style: StylesUtil.operationTextStyle(context),
      ),
    );
  }
}
