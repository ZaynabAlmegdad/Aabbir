import 'package:flutter/material.dart';
import 'package:untitled2/TexrField.dart';
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          SizedBox(height: 15),
          TProgress(),
          SizedBox(height: 25),
          TProgress2(),
          SizedBox(height: 25),
          TProgress3(),
          SizedBox(height: 25),
          TProgress5()

        ],

      ),
    );
  }
}
