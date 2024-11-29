import 'package:flutter/material.dart';

class SimpleStateful extends StatefulWidget {
  const SimpleStateful({super.key});

  @override
  State<SimpleStateful> createState() => _SimpleStatefulState();
}

class _SimpleStatefulState extends State<SimpleStateful> {
  String message = "Hello, Flutter!";

  void changeMessage() {
    setState(() {
      message = "You pressed the button!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sample Stateful Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: changeMessage,
              child: const Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}
