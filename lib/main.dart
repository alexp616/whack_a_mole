import 'package:flutter/material.dart';
import 'dart:math';

const scaryimage = "assets/scaryimage.jpg";
const spook = "assets/spook.jpg";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<bool> status = [false, true, false, false, false, false, false, true, false, false, false, false, true, false, false, false];

  void click(int i) {
    setState(() {
      if (status[i]) {
        _counter++;
        bool notFound = true;
        while (notFound) {
          int rand = Random().nextInt(16);
          if (!status[rand]) {
            status[rand] = true;
            notFound = false;
          }
        }
        status[i] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_counter >= 20) {
      return Image.asset(spook);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter: $_counter"),
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Table(children: [
        TableRow(children: [buildMole(0), buildMole(1), buildMole(2), buildMole(3)]),
        TableRow(children: [buildMole(4), buildMole(5), buildMole(6), buildMole(7)]),
        TableRow(children: [buildMole(8), buildMole(9), buildMole(10), buildMole(11)]),
        TableRow(children: [buildMole(12), buildMole(13), buildMole(14), buildMole(15)])
      ], defaultColumnWidth: const FixedColumnWidth(200.0))),
    );
  }

  Widget buildMole(int meow) {
    return GestureDetector(
        onTap: () {
          click(meow);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(2.0), 
            child: Visibility(visible: status[meow], 
            maintainSize: true, 
            maintainState: true, 
            maintainAnimation: true, 
            child: const SizedBox(
              child: Image(
                image: AssetImage(scaryimage)
              )
            )
          )
        )
      )
    );
  }
}