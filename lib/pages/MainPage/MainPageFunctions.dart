import 'package:flutter/material.dart';

class Functions extends StatefulWidget {
  const Functions({Key? key}) : super(key: key);

  @override
  State<Functions> createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 350),
        child: Column(
          children: [
            Row(
              children: [
                Positioned(


                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        color: Colors.blue[600]
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.house,
                      color: Colors.white,
                    ),
                  ),
                )
              ],

            )


          ],
        ),
      ),

    );

  }
}
