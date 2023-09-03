import 'dart:math';

import 'calculator_helper.dart';

class CalculatorBrain {
  static final CalculatorBrain _singleton = CalculatorBrain._internal();

  factory CalculatorBrain() {
    return _singleton;
  }

  CalculatorBrain._internal();

  String num1 = "";
  String num2 = "";
  String operand = "";
  String output = "0";

  Function(String, String, String, String)? updateUI;

  void setCallback(Function(String, String, String, String) callback) {
    updateUI = callback;
  }

  void buttonClicked(String buttonText) {
    if (isAllClear(buttonText)) {
      _allClear();
    } else if (_isClearLast(buttonText)) {
      _clearLast();
    } else if (isOperand(buttonText)) {
      setOperand(buttonText);
    } else if (isEquals(buttonText)) {
      calculateResult();
      num1 = output;
      num2 = '';
      operand = '';
      output = '';
    } else if (isSpecialOperation(buttonText)) {
      performSpecialOperation(buttonText);
    } else if (isDecimal(buttonText)) {
      addDecimal();
    } else {
      appendNumber(buttonText);
    }

    updateUI?.call(num1, num2, operand, output);
  }

  //
  // void _allClear() {
  //   num1 = "";
  //   num2 = "";
  //   operand = "";
  //   output = "";
  // }
  //
  // void _clearLast() {
  //   // Your clear last logic here
  // }
  //
  // void setOperand(String buttonText) {
  //   operand = buttonText;
  // }
  //
  // void calculateResult() {
  //   // Your calculation logic here
  // }
  //
  // void appendNumber(String buttonText) {
  //   if (operand.isEmpty) {
  //     num1 = num1 + buttonText;
  //   } else {
  //     num2 = num2 + buttonText;
  //     calculateResult();
  //   }
  // }
  //
  // --------------

// Clear all variables and set output to 0
  void _allClear() {
    num1 = "";
    num2 = "";
    operand = "";
    output = "";
  }

// Set the operand for the calculation
  void setOperand(String buttonText) {
    print("Operand: $buttonText");
    operand = buttonText;
  }

// Perform the calculation and update the output
  void calculateResult() {
    print('calculateResult');
    double n1 = double.parse(num1);
    double n2 = double.parse(num2);
    double result = 0;

    if (operand == "+") {
      result = n1 + n2;
    } else if (operand == "-") {
      result = n1 - n2;
    } else if (operand == "×") {
      result = n1 * n2;
    } else if (operand == "÷") {
      if (n2 != 0) {
        result = n1 / n2;
      } else {
        output = "Error";
        return;
      }
    }

    if (result == result.floor()) {
      // If the result is a whole number, convert it to an integer
      output = result.toInt().toString();
    } else {
      // Otherwise, keep it as a double
      output = result.toString();
    }
  }

// Perform special operations like factorial, square root, and percentage
  void performSpecialOperation(String buttonText) {
    print('performSpecialOperation $buttonText');
    double n1 = double.parse(num1);
    double result = 0;

    if (buttonText == "!") {
      result = factorial(n1);
    } else if (buttonText == "√") {
      result = sqrt(n1);
    } else if (buttonText == "%") {
      result = n1 / 100;
    }
    if (result == result.floor()) {
      // If the result is a whole number, convert it to an integer
      output = result.toInt().toString();
    } else {
      // Otherwise, keep it as a double
      output = result.toString();
    }
  }

// Calculate factorial of a number
  double factorial(double n) {
    print('factorial $n');

    double result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }

// Add a decimal point to num1 if it doesn't already contain one
  void addDecimal() {
    print('addDecimal');
    if (!num1.contains(".")) {
      num1 = "$num1.";
    }
  }

// Append the number to either num1 or num2 based on the operand
  void appendNumber(String buttonText) {
    print('appendNumber $buttonText');
    if (operand.isEmpty) {
      num1 = num1 + buttonText;
    } else {
      num2 = num2 + buttonText;
      calculateResult();
    }
  }

  bool _isClearLast(String buttonText) {
    return buttonText == "C";
  }

  void _clearLast() {
    if (operand.isEmpty) {
      num1 = num1.substring(0, num1.length - 1);
      if (output.isNotEmpty) {
        output = num1;
      }
    } else if (num2.isEmpty) {
      operand = '';
    } else {
      if (num2.length > 1) {
        num2 = num2.substring(0, num2.length - 1);
        calculateResult();
      } else {
        num2 = '';
        output = '';
      }
    }
  }
}
