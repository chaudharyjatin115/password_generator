import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget? child;
  final double height;
  ReusableCard({@required this.child, this.height = 80});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff091642),
            borderRadius: BorderRadius.circular(10.0)),
        height: height,
        child: child,
      ),
    );
  }
}
