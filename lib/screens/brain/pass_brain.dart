import 'dart:math';

String generatePassword(bool isWithLetters, bool isWithUppercase,
    bool isWithNumbers, bool isWithSpecial, double numberCharPassword) {
  //Define the allowed chars to use in the password
  String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String _numbers = "0123456789";
  String _special = "@#=+!£\$%&?[](){}";

  //Create the empty string that will contain the allowed chars
  String _allowedChars = "";

  //Put chars on the allowed ones based on the input values
  _allowedChars += (isWithLetters ? _lowerCaseLetters : '');
  _allowedChars += (isWithUppercase ? _upperCaseLetters : '');
  _allowedChars += (isWithNumbers ? _numbers : '');
  _allowedChars += (isWithSpecial ? _special : '');

  int i = 0;
  String _result = "";

  //Create password
  while (i < numberCharPassword.round()) {
    //Get random int
    int randomInt = Random.secure().nextInt(_allowedChars.length);
    //Get random char and append it to the password
    _result += _allowedChars[randomInt];
    i++;
  }

  return _result;
}
