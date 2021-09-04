import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/brain/pass_brain.dart';
import 'package:password_generator/widgets/reusableWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PassGen extends StatefulWidget {
  bool includeLowercase = false;
  bool includeNumbers = false;
  double length = 8;
  bool includeSpecial = true;
  bool includeUpperCase = true;

  @override
  _PassGenState createState() => _PassGenState();
}

class _PassGenState extends State<PassGen> {
  String _Password = '';

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
            child: ListTile(
              title: Text(
                '$_Password',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(text: _Password));
                  Fluttertoast.showToast(
                      msg: "Password Copied",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 16.0);
                },
                icon: Icon(Icons.copy),
              ),
            ),
          ),
          ReusableCard(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('8'),
                  ),
                ),
                Container(
                  width: 330.0,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('32'),
                  ),
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
                  setState(() {
                    widget.includeUpperCase = newValue;
                  });
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Lowercase'),
                value: widget.includeLowercase,
                onChanged: (bool ewValue) {
                  print(ewValue);
                  setState(() {
                    widget.includeLowercase = ewValue;
                  });
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
              title: Text('Include Special'),
              value: widget.includeSpecial,
              onChanged: (bool trueValue) {
                print(trueValue);
                setState(
                  () {
                    widget.includeSpecial = trueValue;
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
                  onPressed: () {
                    setState(() {
                      _Password = PasswordGenerator().generatePassword(
                          widget.includeLowercase,
                          widget.includeUpperCase,
                          widget.includeNumbers,
                          widget.includeSpecial,
                          widget.length);
                    });
                  },
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