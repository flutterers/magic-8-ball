import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: const Center(
            child: Text(
              "Ask Me Anything!",
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        body: const Magic8BallPage(),
      ),
    );
  }
}

class Magic8BallPage extends StatefulWidget {
  const Magic8BallPage({Key? key}) : super(key: key);

  @override
  State<Magic8BallPage> createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  int BallNo = 1;

  void randomizeAnswer() {
    setState(() {
      BallNo = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: TextButton(
          style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
          ),
          onPressed: () {
            randomizeAnswer();
          },
          child: Image.asset(
            "images/ball$BallNo.png",
          ),
        ),
      ),
    );
  }
}
