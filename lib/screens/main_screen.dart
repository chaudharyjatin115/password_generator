import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/widgets/reusableWidget.dart';

class PassGen extends StatefulWidget {
  @override
  _PassGenState createState() => _PassGenState();
}

class _PassGenState extends State<PassGen> {
  late bool newValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Generator',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            trailing: CircleAvatar(
              backgroundImage: AssetImage('images/man.png'),
            ),
          ),
          SizedBox(height: 30.0),
          ReusableCard(
            child: Row(),
            height: 90.0,
          ),
          ReusableCard(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Include Alphabets'),
                ),
                SizedBox(
                  width: 80.0,
                ),
                Switch(
                    value: false,
                    onChanged: (bool onvlaue) {
                      setState(() {
                        newValue = onvlaue;
                      });
                    })
              ],
            ),
          ),
          ReusableCard(
            child: Row(),
          ),
        ],
      ),
    );
  }
}

// // Expanded(
//                     child: Text(
//                       'fjkdjfkjfk',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.copy_outlined,
//                       color: Colors.white,
//                     ),
//                   ),