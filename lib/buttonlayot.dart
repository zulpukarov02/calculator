import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonLayot extends StatefulWidget {
  const ButtonLayot({Key? key}) : super(key: key);

  @override
  State<ButtonLayot> createState() => _ButtonLayotState();
}

class _ButtonLayotState extends State<ButtonLayot> {
  String input = "";
  String result = "0";
  String output = "";
  List<String> buttonList = [
    'C',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Flexible(
            child: rezoultWidget(),
            flex: 1,
          ),
          Flexible(
            child: buttonsWidget(),
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget rezoultWidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            input,
            style: TextStyle(fontSize: 32, color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget buttonsWidget() {
    return GridView.builder(
      itemCount: buttonList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return button(buttonList[index], index);
      },
    );
  }

  Widget button(String text, int index) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            buttOnPress(text);
          });
        },
        color: getColor(text),
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(fontSize: 25),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  buttOnPress(String text) {
    if (text == "AC") {
      input = "";
      result = "0";
      return;
    }
    if (text == "C") {
      input = input.substring(0, input.length - 1);
      return;
    }
    if (text == "=") {
      result = calculet();
      if (result.endsWith(".0")) result = result.replaceAll(".0", "");
      return;
    }
    input = input + text;
  }

  String calculet() {
    try {
      var exp = Parser().parse(input);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "=") {
      return Colors.orangeAccent;
    }
    if (text == "C" || text == "AC") {
      return Colors.redAccent;
    }
    if (text == "(" || text == ")") {
      return Colors.blueGrey;
    }
    return Colors.deepPurple;
  }
}
  // void onButtonPressed(String buttonText) {
  //   setState(() {
  //     if (buttonText == "=") {
  //       calculateResult();
  //     } else if (buttonText == "C") {
  //       clearInput();
  //     } else if (buttonText == "+" ||
  //         buttonText == "-" ||
  //         buttonText == "*" ||
  //         buttonText == "/") {
  //       if (input.isNotEmpty && currentOperation.isEmpty) {
  //         currentOperation = buttonText;
  //         output = input;
  //         input = "";
  //       }
  //     } else {
  //       input += buttonText;
  //     }
  //   });
  // }

  // void calculateResult() {
  //   if (input.isNotEmpty && currentOperation.isNotEmpty) {
  //     double num1 = double.parse(output);
  //     double num2 = double.parse(input);
  //     double result;

  //     if (currentOperation == "+") {
  //       result = num1 + num2;
  //     } else if (currentOperation == "-") {
  //       result = num1 - num2;
  //     } else if (currentOperation == "*") {
  //       result = num1 * num2;
  //     } else if (currentOperation == "/") {
  //       result = num1 / num2;
  //     }

  //     // input = result.toString();
  //     currentOperation = "";
  //   }
  // }

  // void clearInput() {
  //   setState(() {
  //     input = "";
  //     currentOperation = "";
  //     output = "";
  //   });
  // }

// enum ButtonType {
//   Number,
//   Operator,
//   Clear,
//   Equals,
// }

// class Button_San extends StatelessWidget {
//   final String text;
//   final ButtonType type;
//   final Function(String) onPressed;

//   const Button_San({
//     required this.text,
//     required this.type,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color buttonColor =
//         type == ButtonType.Number ? Colors.deepPurple : Colors.white;
//     Color textColor =
//         type == ButtonType.Number ? Colors.deepPurple : Colors.blue;

//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Container(
//           color: buttonColor,
//           child: TextButton(
//             onPressed: () => onPressed(text),
//             child: Center(
//               child: Text(
//                 text,
//                 style: TextStyle(color: textColor, fontSize: fontSize),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class ButtonLayot extends StatefulWidget {
//   const ButtonLayot({Key? key}) : super(key: key);

//   @override
//   _ButtonLayotState createState() => _ButtonLayotState();
// }

// double fontSize = 20;
// double padding = 5;
// double borderRadius = 20;

// class _ButtonLayotState extends State<ButtonLayot> {
//   String input = "";
//   String currentOperation = "";
//   String output = "";

//   void onButtonPressed(String buttonText) {
//     setState(() {
//       if (buttonText == "=") {
//         calculateResult();
//       } else if (buttonText == "C") {
//         clearInput();
//       } else {
//         input += buttonText;
//       }
//     });
//   }

//   void calculateResult() {
//     if (input.isNotEmpty && currentOperation.isNotEmpty) {
//       double num1 = double.parse(output);
//       double num2 = double.parse(input);

//       if (currentOperation == "+") {
//         output = (num1 + num2).toString();
//       }
//       // Добавьте здесь другие операции, такие как "-", "*", "/"...

//       input = "";
//       currentOperation = "";
//     }
//   }

//   void clearInput() {
//     setState(() {
//       input = "";
//       currentOperation = "";
//       output = "";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[100],
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(),
//           ),
//           Expanded(
//             child: GridView.builder(
//               itemCount: 20, // Количество элементов в сетке
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4, // Количество столбцов в сетке
//               ),
//               itemBuilder: (context, index) {
//                 return Button_San(
//                   text: (index + 1)
//                       .toString(), // Индекс + 1 даст значения от 1 до 8
//                   type: ButtonType.Number,
//                   onPressed: onButtonPressed,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum ButtonType {
//   Number,
//   Operator,
//   Clear,
//   Equals,
// }

// class Button_San extends StatelessWidget {
//   final String text;
//   final ButtonType type;
//   final Function(String) onPressed;

//   const Button_San({
//     required this.text,
//     required this.type,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color buttonColor =
//         type == ButtonType.Number ? Colors.deepPurple : Colors.white;
//     Color textColor =
//         type == ButtonType.Number ? Colors.deepPurple : Colors.blue;

//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Container(
//           color: buttonColor,
//           child: TextButton(
//             onPressed: () => onPressed(text),
//             child: Center(
//               child: Text(
//                 text,
//                 style: TextStyle(color: textColor, fontSize: fontSize),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // class Button_San extends StatelessWidget {
// //   final String text;
// //   final Function(String) onPressed;

// //   const Button_San({
// //     required this.text,
// //     required this.onPressed,
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.all(padding),
// //       child: ClipRRect(
// //         borderRadius: BorderRadius.circular(borderRadius),
// //         child: Container(
// //           color: Colors.deepPurple[50],
// //           child: TextButton(
// //             onPressed: () => onPressed(text),
// //             child: Center(
// //               child: Text(
// //                 text,
// //                 style: TextStyle(color: Colors.deepPurple, fontSize: fontSize),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
