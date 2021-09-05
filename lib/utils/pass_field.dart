import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PassField extends StatefulWidget {
  final String? password;
  const PassField(this.password);

  @override
  _PassFieldState createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.password}',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {
          Clipboard.setData(new ClipboardData(text: widget.password));
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
    );
  }
}
