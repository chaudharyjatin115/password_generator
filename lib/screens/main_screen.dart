import 'package:flutter/material.dart';

import 'package:password_generator/widgets/reusableWidget.dart';

class PassGen extends StatefulWidget {
  bool includeLowecase = true;
  bool includeNumbers = false;
  double length = 8;
  bool includeSpecial = true;
  bool includeUpperCase = true;

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
              'Password Generator',
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
                  child: Text('8'),
                ),
                Container(
                  width: 350.0,
                  child: Slider(
                      value: widget.length,
                      min: 8,
                      max: 32,
                      onChanged: (double slidValue) {
                        setState(() {
                          widget.length = slidValue.toDouble();
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('32'),
                )
              ],
            ),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include UpperCase'),
                value: widget.includeUpperCase,
                onChanged: (bool newValue) {
                  print(newValue);
                  widget.includeUpperCase = newValue;
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Lowercase'),
                value: widget.includeLowecase,
                onChanged: (bool newValue) {
                  print(newValue);
                  setState(() {
                    widget.includeLowecase = newValue;
                  });
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
              title: Text('Include Special'),
              value: widget.includeSpecial,
              onChanged: (bool newValue) {
                print(newValue);
                setState(
                  () {
                    widget.includeSpecial = newValue;
                  },
                );
              },
            ),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Numbers'),
                value: widget.includeNumbers,
                onChanged: (bool newValue) {
                  setState(() {
                    widget.includeNumbers = newValue;
                  });
                }),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
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
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Generate Password',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          )
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