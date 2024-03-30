import 'package:calculatorapp/screens/utilities/colors.dart';
import 'package:calculatorapp/screens/widgets/button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String op = '';
  dynamic text = '0';
  double num1 = 0;
  double num2 = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic operator = '';
  dynamic preOperator = '';
  final List<Color> colors = [
    AppColors.CandCE,
    AppColors.backgroundColor,
    AppColors.backgroundColor,
    AppColors.CandCE,
    AppColors.digitColor,
    AppColors.digitColor,
    AppColors.digitColor,
    AppColors.darkBrown,
    AppColors.digitColor,
    AppColors.digitColor,
    AppColors.digitColor,
    AppColors.darkBrown,
    AppColors.digitColor,
    AppColors.digitColor,
    AppColors.digitColor,
    AppColors.darkBrown,
    AppColors.digitColor,
    AppColors.darkBrown,
    AppColors.darkBrown,
    AppColors.darkBrown,
  ];
  final List<String> calculatorButtons = [
    'AC',
    '',
    '',
    '⌫',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(children: [
          SizedBox(
            height: h * 0.06,
          ),
          SizedBox(
            width: w * 0.95,
            height: h * 0.05,
            child: const Row(
              children: [
                Center(
                    child: Text(
                  "Calculator",
                  style: TextStyle(
                      fontFamily: 'EurostileFont',
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Container(
            width: w * 1,
            height: h * 0.01,
            color: AppColors.CandCE,
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Container(
            color: Colors.red,
            child: Stack(
              children: [
                Container(
                  width: w * 1,
                  height: h * 0.2,
                  color: Colors.black,
                ),
                Positioned(
                  top: h * 0.01,
                  left: w * 0.015,
                  child: Container(
                    width: w * 0.97,
                    height: h * 0.18,
                    color: AppColors.backg,
                  ),
                ),
                Positioned(
                  top: h * 0.02,
                  left: w * 0.03,
                  child: Container(
                    width: w * 0.94,
                    height: h * 0.16,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: h * 0.03,
                  left: w * 0.045,
                  child: Container(
                    width: w * 0.91,
                    height: h * 0.14,
                    color: const Color.fromARGB(255, 136, 135, 111),
                  ),
                ),
                Positioned(
                  top: h * 0.04,
                  left: w * 0.06,
                  child: SizedBox(
                    width: w * 0.88,
                    height: h * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SingleChildScrollView(
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                                child: Text(
                              text,
                              style: TextStyle(
                                fontFamily: 'EurostileFont',
                                fontSize: text.length > 8 ? 30 : 60,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: h * 0.009,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 136, 135, 111)),
            width: w * 0.1,
            height: h * 0.04,
            child: Center(child: Text(op,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w900,fontFamily: 'EurostileFont'),)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SizedBox(
              height: h * 0.59,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      childAspectRatio: 1.2),
                  itemCount: calculatorButtons.length,
                  itemBuilder: (context, index) {
                    return ButtonPress(
                      buttonColor: colors[index],
                      buttonName: calculatorButtons[index],
                      onPressed: () {
                        calculation(calculatorButtons[index]);
                        operatorDisplay(calculatorButtons[index]);
                        print('Button pressed: ${calculatorButtons[index]}');
                      },
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }

  calculation(buttonVal) {
    if (buttonVal == 'AC') {
      text = '0';
      num1 = 0;
      num2 = 0;
      result = '';
      finalResult = '0';
      operator = '';
      preOperator = '';
    } else if (operator == '=' && buttonVal != '=') {
    setState(() {
      num1 = double.parse(finalResult);
      num2 = 0;
      result = '';
      finalResult = '';
      operator = '';
      preOperator = '';
    });
  } else if ((buttonVal == '/' || buttonVal == '*') &&
        num1.toString().isEmpty) {
      return;
    } else if (operator == '=' && buttonVal == '=') {
      if (preOperator == '+') {
        finalResult = add();
      } else if (preOperator == '-') {
        finalResult = sub();
      } else if (preOperator == 'x') {
        finalResult = mul();
      } else if (preOperator == '/') {
        finalResult = div();
      }
    } else if (buttonVal == '+' ||
        buttonVal == '-' ||
        buttonVal == 'x' ||
        buttonVal == '/' ||
        buttonVal == '=') {
      if (num1 == 0) {
        num1 = double.parse(result);
      } else {
        num2 = double.parse(result);
      }

      if (operator == '+') {
        finalResult = add();
      } else if (operator == '-') {
        finalResult = sub();
      } else if (operator == 'x') {
        finalResult = mul();
      } else if (operator == '/') {
        finalResult = div();
      }
      preOperator = operator;
      operator = buttonVal;
      result = '';
    } else if (buttonVal == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (buttonVal == '⌫') {
      if (result.isNotEmpty) {
        result = result.substring(0, result.length - 1);
        finalResult = result;
      }
    } else {
      result = result + buttonVal;
      finalResult = result;
    }

    setState(() {
      print(finalResult);
      text = finalResult;
    });
  }

  String add() {
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }


  String formatNumber(int value) {
    if (value.toString().length > 7) {
      // Convert the value to exponential notation
      return value.toStringAsExponential();
    } else {
      // If the length is within the threshold, return the original value
      return value.toString();
    }
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');

      String integerPart = splitDecimal[0];
      integerPart = formatNumber(int.parse(integerPart));
      String decimalPart = splitDecimal[1];
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      } else if (decimalPart.length > 5) {
        decimalPart = decimalPart.substring(0, 5);
        result = "$integerPart.$decimalPart";
        return result;
      }
    }
    return result;
  }

  operatorDisplay(String operator) {
    if(operator == 'AC'){
      setState(() {
        op = '';
      });
    }
    if (operator == '+') {
      setState(() {
        op = "+";
      });
    }
    if (operator == '-') {
      setState(() {
        op = "-";
      });
    }
    if (operator == '/') {
      setState(() {
        op = "/";
      });
    }
    if (operator == 'x') {
      setState(() {
        op = "x";
      });
    }
    if (operator == '=') {
      setState(() {
        op = "=";
      });
    }
  }
}
