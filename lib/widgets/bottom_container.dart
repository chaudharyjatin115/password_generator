import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Widget? child;
  const BottomButton(this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.center,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlue, Color(0xff1F70F4)],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
          ),
          child: child),
    );
  }
}
