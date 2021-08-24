import 'package:flutter/material.dart';

import 'package:password_generator/widgets/reusableWidget.dart';

class PassGen extends StatefulWidget {
  bool includeLetters = true;
  bool includeNumbers = false;
  double length = 8;
  @override
  _PassGenState createState() => _PassGenState();
}

class _PassGenState extends State<PassGen> {
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
                  child: Text('Include Numbers'),
                ),
                SizedBox(
                  width: 100.0,
                ),
                Switch(
                    value: widget.includeNumbers,
                    onChanged: (bool onvlaue) {
                      print(onvlaue);
                      setState(() {
                        widget.includeNumbers = onvlaue;
                      });
                    })
              ],
            ),
          ),
          ReusableCard(
            child: Row(
              children: [
                Text('8'),
                Slider(
                    value: widget.length,
                    min: 8,
                    max: 32,
                    onChanged: (double slidValue) {
                      setState(() {
                        widget.length = slidValue.toDouble();
                      });
                    }),
                Text('32')
              ],
            ),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Letters'),
                value: widget.includeLetters,
                onChanged: (bool newValue) {
                  print(newValue);
                  setState(() {
                    widget.includeLetters = newValue;
                  });
                }),
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