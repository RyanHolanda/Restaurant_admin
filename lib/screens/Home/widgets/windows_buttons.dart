import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var buttonColors = WindowButtonColors(
        iconMouseDown: Colors.red,
        iconMouseOver: Colors.grey.shade400,
        iconNormal: Colors.grey.shade400,
        normal: Colors.transparent,
        mouseOver: const Color.fromARGB(30, 0, 0, 0),
        mouseDown: const Color.fromARGB(30, 0, 0, 0));
    return Row(
      children: [
        MinimizeWindowButton(
          colors: buttonColors,
        ),
        MaximizeWindowButton(
          colors: buttonColors,
        ),
        CloseWindowButton()
      ],
    );
  }
}
