import 'package:flutter/material.dart';

// entry point of the flutter application
void main() {
  runApp(const MyApp());
}

// root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title used by the operating system
      title: 'Flutter Calculator',

      // app-wide theme configuration
      theme: ThemeData(
        // generate colour scheme from a seed colour
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),

      // first screen shown when the app starts
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

// stateful widget because calculator data changes over time
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // title displayed in the app bar
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// state class holding calculator logic and data
class _MyHomePageState extends State<MyHomePage> {
  // list to store entered numbers
  List<double> numbers = [];

  // currently selected operator (+, -, *, /)
  String? operator;

  // number currently being typed by the user
  String userNumber = "";

  // last calculated result
  double result = 0;

  // performs a calculation based on the operator
  double calc(String op, double a, double b) {
    switch (op) {
      case "+":
        return a + b;
      case "-":
        return a - b;
      case "*":
        return a * b;
      case "/":
        return a / b;
      default:
        return b;
    }
  }

  // resets the calculator to its initial state
  void clearAll() {
    setState(() {
      numbers.clear();
      operator = null;
      userNumber = "";
      result = 0;
    });
  }

  // handles all button presses
  void digitEntry(String value) {
    setState(() {
      // clear everything
      if (value == "C") {
        clearAll();
        return;
      }

      // remove last entered character
      if (value == "⌫") {
        if (userNumber.isNotEmpty) {
          userNumber = userNumber.substring(0, userNumber.length - 1);
        }
        return;
      }

      // handle digits and decimal point
      if (!["+", "-", "*", "/", "="].contains(value)) {
        // prevent multiple decimal points
        if (value == "." && userNumber.contains(".")) return;
        userNumber += value;
        return;
      }

      // ignore operator input if nothing has been entered yet
      if (userNumber.isEmpty && numbers.isEmpty) return;

      // convert typed number into a double and store it
      if (userNumber.isNotEmpty) {
        numbers.add(double.parse(userNumber));
      }

      // reset input field
      userNumber = "";

      // perform calculation when two numbers and an operator exist
      if (numbers.length == 2 && operator != null) {
        result = calc(operator!, numbers[0], numbers[1]);
        numbers = [result];
      }

      // handle equals or store new operator
      if (value == "=") {
        userNumber = result.toString();
        operator = null;
        numbers.clear();
      } else {
        operator = value;
      }
    });
  }

  // reusable calculator button widget
  Widget calcButton(
    String text, {
    Color color = Colors.blueGrey,
    Color textColor = Colors.white,
  }) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        // call digitEntry when button is pressed
        onPressed: () => digitEntry(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 22, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // top app bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      // main content area
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // display area for numbers and results
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  // show typed number if available, otherwise show result
                  userNumber.isEmpty ? result.toString() : userNumber,
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),

          // calculator button layout
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcButton("C", color: Colors.red),
                  calcButton("⌫", color: Colors.orange),
                  calcButton("/", color: Colors.deepOrange),
                  calcButton("*", color: Colors.deepOrange),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcButton("7"),
                  calcButton("8"),
                  calcButton("9"),
                  calcButton("-", color: Colors.deepOrange),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcButton("4"),
                  calcButton("5"),
                  calcButton("6"),
                  calcButton("+", color: Colors.deepOrange),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcButton("1"),
                  calcButton("2"),
                  calcButton("3"),
                  calcButton("=", color: Colors.green),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 70),
                  calcButton("0"),
                  calcButton("."),
                  const SizedBox(width: 70),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
