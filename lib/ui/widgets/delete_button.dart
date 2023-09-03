import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeleteButton extends StatefulWidget {
  final Function(String) onPressed;

  const DeleteButton({super.key, required this.onPressed});

  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => widget.onPressed('C'),
      shape: const CircleBorder(), // Set the shape to circle
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          'assets/images/delete2.svg',
          height: 60,
          width: 55,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
        ),
      ),
    );
  }
}
