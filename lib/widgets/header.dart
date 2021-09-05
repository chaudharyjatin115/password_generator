import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Password Generator',
        style: TextStyle(color: Colors.white, fontSize: 30.0),
      ),
      trailing: CircleAvatar(
        backgroundImage: AssetImage('images/man.png'),
      ),
    );
  }
}
