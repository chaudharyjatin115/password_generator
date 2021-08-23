import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                Text('Include Alphabets'),
                SizedBox(
                  width: 40.0,
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