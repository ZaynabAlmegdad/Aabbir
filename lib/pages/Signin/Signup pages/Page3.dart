import 'package:flutter/material.dart';
import 'package:untitled2/TexrField.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),

      child: Column(
        children: [

          TProgress8(),
        ],
      ),
    );
  }
}
