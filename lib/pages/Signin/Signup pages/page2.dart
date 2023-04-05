import 'package:flutter/material.dart';
import 'package:untitled2/TextField.dart';
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: Column(

        children: [
          SizedBox(height: 15),
          TProgress6(),
          SizedBox(height: 25),
          TProgress7(),


        ],

      ),
    );
  }
}