import 'package:simple_calc/ui/widgets/delete_button.dart';

import '../../res/calc_characters.dart';

bool isEquals(String text) {
  return text == CalcCharacters.equals;
}

bool isSpecialOperation(String text) {
  return ["!", "√", "%"].contains(text);
}

bool isDigit(String text) {
  return RegExp(r'[0-9]').hasMatch(text);
}

bool isDecimal(String text) {
  return text == CalcCharacters.decimal;
}

bool isAllClear(String text) {
  return text == CalcCharacters.allClear;
}

bool isOperand(String text) {
  return ["+", "-", "×", "÷"].contains(text);
}

bool isOperation(String text) {
  return ["+", "-", "×", "÷", "!", "√", "%", "=", "C", ".", "AC"].contains(text);
}
