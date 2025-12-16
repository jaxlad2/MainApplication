import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List number = [];
  String? operator;
  int i = 0;
  List tempinput = [];
  String usernumber = "";
  void digitentry(String entryvalue){
    setState((){
      if (entryvalue == "BACK" && tempinput.isNotEmpty){
        tempinput.removeLast();
        usernumber = tempinput.join();
      }
      else if (entryvalue == "+" || entryvalue == "-" || entryvalue == "*" || entryvalue == "/" ||entryvalue =="=" ){// operator functionality
        number.add(double.parse(usernumber));
        operator = entryvalue;
        print(number);
        tempinput = [];
        usernumber = "";
        i = i+1;
      }
      else{
        tempinput.add(entryvalue);
        usernumber = tempinput.join();
      }
      if(entryvalue == "="){//calculation functionality
        //add a switch case for checking operator
        double output = number[0] + number[1];
        print(output);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            //make top row with 2 operator buttons to make formatting easier, figure out maths functionality
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => digitentry("7"),
                  tooltip: '7',
                  child: const Text("7"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("8"),
                  tooltip: '8',
                  child: const Text("8"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("9"),
                  tooltip: '9',
                  child: const Text("9"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("-"),
                  tooltip: 'minus operator',
                  child: const Text("-")
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => digitentry("4"),
                  tooltip: '4',
                  child: const Text("4"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("5"),
                  tooltip: '5',
                  child: const Text("5"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("6"),
                  tooltip: '6',
                  child: const Text("6"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("+"),
                  tooltip: 'addition operator',
                  child: const Text("+")
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => digitentry("1"),
                  tooltip: '1',
                  child: const Text("1"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("2"),
                  tooltip: '2',
                  child: const Text("2"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("3"),
                  tooltip: '3',
                  child: const Text("3"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("="),
                  tooltip: 'equals operator',
                  child: const Text("=")
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                FloatingActionButton(
                  onPressed: () => digitentry("0"),
                  tooltip: '0',
                  child: const Text("0"),
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("*"),
                  tooltip: 'multiplication operator',
                  child: const Text("*")
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("/"),
                  tooltip: 'division operator',
                  child: const Text("/")
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("."),
                  tooltip: 'decimal point',
                  child: const Text(".")
                ),
                FloatingActionButton(
                  onPressed: () => digitentry("BACK"),
                  tooltip: 'Backspace',
                  child: const Text("⌫")
                ),
              ]
            ),
              
            

            const Text('Your equation: '),
            Text(
              '$usernumber',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      
    );
  }
}
