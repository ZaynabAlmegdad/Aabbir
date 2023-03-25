import 'package:flutter/material.dart';

void main() => runApp;
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('About us')),
    body: Column(children:const [
      Text("عبر:",
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
        ),
      ),
      Text("------------------------------------",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),

    ],
    ),
  );
}