import 'dart:math';

abstract class Rangen {}

class GenerateInt extends Rangen {
  var random = Random();
  String generate(int length) {
    String number = '';
    for (var i = 0; i < length; i++) {
      number += random.nextInt(10).toString();
    }
    return number;
  }
}
