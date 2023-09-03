import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:simple_calc/res/calc_characters.dart';
import 'package:simple_calc/res/styles.dart';

import '../logic/calculator_brain.dart';
import '../logic/calculator_helper.dart';
import '../widgets/delete_button.dart';
import '../widgets/equal_button.dart';
import '../widgets/number_button.dart';
import '../widgets/operation_button.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String num1 = "";
  String num2 = "";
  String operand = "";
  String output = "0";

  @override
  void initState() {
    super.initState();

    CalculatorBrain().setCallback(updateUI);


    // Set the preferred orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Initialize the brightness for the status bar icons
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Brightness statusBarIconBrightness = StylesUtil.getBrightness(context);

      // Update the system UI overlay styles
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness,
      ));
    });
  }

  void updateUI(String num1, String num2, String operand, String output) {
    setState(() {
      this.num1 = num1;
      this.num2 = num2;
      this.operand = operand;
      this.output = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: StylesUtil.outputBackGroundColor(context),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$num1 ${operand.trim()} ${num2.trim()}',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: StylesUtil.outputTextColor(context),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: 48.0,
                      color: StylesUtil.outputTextColor(context),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme
                .of(context)
                .colorScheme
                .surface,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildButtonRow([CalcCharacters.allClear, CalcCharacters.factorial, CalcCharacters.squareRoot, CalcCharacters.divide]),
                buildButtonRow([CalcCharacters.seven, CalcCharacters.eight, CalcCharacters.nine, CalcCharacters.multiply]),
                buildButtonRow([CalcCharacters.four, CalcCharacters.five, CalcCharacters.six, CalcCharacters.subtract]),
                buildButtonRow([CalcCharacters.one, CalcCharacters.two, CalcCharacters.three, CalcCharacters.add]),
                buildButtonRow([CalcCharacters.decimal, CalcCharacters.zero, CalcCharacters.clear, CalcCharacters.equals]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a row of buttons
  Widget buildButtonRow(List<String> buttonLabels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttonLabels.map((label) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: _getButton(label),
          ),
        );
      }).toList(),
    );
  }

  Widget _getButton(String label) {
    if (isDigit(label)) {
      return NumberButton(
        onPressed: buttonClicked,
        label: label,
      );
    } else if (label == "=") {
      return EqualButton(onPressed: buttonClicked);
    } else if (label == "C") {
      return DeleteButton(onPressed: buttonClicked);
    } else if (isOperation(label)) {
      return OperationButton(
        onPressed: buttonClicked,
        label: label,
      );
    }
    return const Placeholder();
  }

  void buttonClicked(String buttonText) {
    CalculatorBrain().buttonClicked(buttonText);
  }

}
    // if (isAllClear(buttonText)) {
    //   _allClear();
    // } else if (_isClearLast(buttonText)) {
    //   _clearLast();
    // } else if (isOperand(buttonText)) {
    //   setOperand(buttonText);
    // } else if (isEquals(buttonText)) {
    //   calculateResult();
    //   setState(() {
    //     num1 = output;
    //     num2 = '';
    //     operand = '';
    //     output = '';
    //   });
    // } else if (isSpecialOperation(buttonText)) {
    //   performSpecialOperation(buttonText);
    // } else if (isDecimal(buttonText)) {
    //   addDecimal();
    // } else {
    //   appendNumber(buttonText);
    // }
  // }
//
// // Clear all variables and set output to 0
//   void _allClear() {
//     setState(() {
//       num1 = "";
//       num2 = "";
//       operand = "";
//       output = "";
//     });
//   }
//
// // Set the operand for the calculation
//   void setOperand(String buttonText) {
//     print("Operand: $buttonText");
//     setState(() {
//       operand = buttonText;
//     });
//   }
//
// // Perform the calculation and update the output
//   void calculateResult() {
//     print('calculateResult');
//     double n1 = double.parse(num1);
//     double n2 = double.parse(num2);
//     double result = 0;
//
//     if (operand == "+") {
//       result = n1 + n2;
//     } else if (operand == "-") {
//       result = n1 - n2;
//     } else if (operand == "×") {
//       result = n1 * n2;
//     } else if (operand == "÷") {
//       if (n2 != 0) {
//         result = n1 / n2;
//       } else {
//         output = "Error";
//         return;
//       }
//     }
//
//     setState(() {
//       if (result == result.floor()) {
//         // If the result is a whole number, convert it to an integer
//         output = result.toInt().toString();
//       } else {
//         // Otherwise, keep it as a double
//         output = result.toString();
//       }
//     });
//   }
//
// // Perform special operations like factorial, square root, and percentage
//   void performSpecialOperation(String buttonText) {
//     print('performSpecialOperation $buttonText');
//     double n1 = double.parse(num1);
//     double result = 0;
//
//     if (buttonText == "!") {
//       result = factorial(n1);
//     } else if (buttonText == "√") {
//       result = sqrt(n1);
//     } else if (buttonText == "%") {
//       result = n1 / 100;
//     }
//     setState(() {
//       if (result == result.floor()) {
//         // If the result is a whole number, convert it to an integer
//         output = result.toInt().toString();
//       } else {
//         // Otherwise, keep it as a double
//         output = result.toString();
//       }
//     });
//   }
//
// // Calculate factorial of a number
//   double factorial(double n) {
//     print('factorial $n');
//
//     double result = 1;
//     for (int i = 1; i <= n; i++) {
//       result *= i;
//     }
//     return result;
//   }
//
// // Add a decimal point to num1 if it doesn't already contain one
//   void addDecimal() {
//     print('addDecimal');
//     if (!num1.contains(".")) {
//       setState(() {
//         num1 = "$num1.";
//       });
//     }
//   }
//
// // Append the number to either num1 or num2 based on the operand
//   void appendNumber(String buttonText) {
//     print('appendNumber $buttonText');
//     if (operand.isEmpty) {
//       num1 = num1 + buttonText;
//     } else {
//       num2 = num2 + buttonText;
//       calculateResult();
//     }
//     setState(() {});
//   }
//
//   bool _isClearLast(String buttonText) {
//     return buttonText == "C";
//   }
//
//   void _clearLast() {
//     if (operand.isEmpty) {
//       setState(() {
//         num1 = num1.substring(0, num1.length - 1);
//         if (output.isNotEmpty) {
//           output = num1;
//         }
//       });
//     } else if (num2.isEmpty) {
//       setState(() {
//         operand = '';
//       });
//     } else {
//       if (num2.length > 1) {
//         setState(() {
//           num2 = num2.substring(0, num2.length - 1);
//         });
//         calculateResult();
//       } else {
//         setState(() {
//           num2 = '';
//           output = '';
//         });
//       }
//     }
//   }
// }
