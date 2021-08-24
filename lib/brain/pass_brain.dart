import 'dart:math';

class PasswordGenerator {
  String generatePassword(bool isWithLowercase, bool isWithUppercase,
      bool isWithNumbers, bool isWithSpecial, double numberCharPassword) {
    //Define the allowed chars to use in the password
    String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
    String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String _numbers = "0123456789";
    String _special = "@#=+!£\$%&?[](){}";

    String _allowedChars = "";

    //Put chars on the allowed ones based on the input values
    _allowedChars += (isWithLowercase ? _lowerCaseLetters : '');
    _allowedChars += (isWithUppercase ? _upperCaseLetters : '');
    _allowedChars += (isWithNumbers ? _numbers : '');
    _allowedChars += (isWithSpecial ? _special : '');

    int i = 0;
    String result = "";

    //create pass
    while (i < numberCharPassword.round()) {
      //random int
      int randomInt = Random.secure().nextInt(_allowedChars.length);
      //get random char
      result += _allowedChars[randomInt];
      i++;
    }
    return result;
  }
}
