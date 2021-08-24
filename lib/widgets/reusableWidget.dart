import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget? child;
  final double height;
  ReusableCard({@required this.child, this.height = 80});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff091642),
              borderRadius: BorderRadius.circular(10.0)),
          height: height,
          child: child,
        ),
      ),
    );
  }
}
