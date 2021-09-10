import 'package:flutter/cupertino.dart';
import 'package:password_generator/brain/pass_brain.dart';

class PassProvider extends ChangeNotifier {
  String password = '';
  bool includeLowercase = true;
  bool includeNumbers = true;
  double length = 8;
  bool includeSpecial = true;
  bool includeUpperCase = true;
  // ignore: unused_field

  void getPass() {
    password = PasswordGenerator().generatePassword(includeLowercase,
        includeUpperCase, includeNumbers, includeSpecial, length);

    notifyListeners();
  }

  void togglower(bool toggl) {
    includeLowercase = toggl;
    notifyListeners();
  }

  void toggup(bool togg) {
    includeUpperCase = togg;
    notifyListeners();
  }

  void toggnum(bool tog) {
    includeNumbers = tog;
    notifyListeners();
  }

  void toggspe(bool to) {
    includeSpecial = to;
    notifyListeners();
  }

  void setLength(double len) {
    length = len.toDouble();
    notifyListeners();
  }
}
