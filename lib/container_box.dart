import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ContainerBox({required this.boxColor, required this.childWidget});
  final Color boxColor;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
      ),
    );
  }
}
