import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/dashboard.dart';

void main() => runApp(const MaterialApp(
  home: About(),
));

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _About();
}

class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent[100],
        body: Stack(children: [
          Positioned(
            top: 30,
            right: 20,
            child: Center(
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          child: FloatingActionButton.small(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()),
                              );
                            },
                            backgroundColor: Colors.blue[100],
                            child: const Icon(Icons.arrow_forward_ios),
                          ))),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 140,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    ":نـبـذة عـنـا",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: Column(
              children: [
                Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width - 0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
            top: 215,
            right: 0,
            left: 20,
            child: Container(
              height: 75,
              width: 75,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/Logo.png'))),
            ),
          ),
          Positioned(
            top: 310,
            right: 20,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    ":عَـبِّـر",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 57, 147),
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370,
            right: 15,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    "هو نظام اتصال معزز وبديل متاح بدون تكاليف \n\اضافية ، و يمكن استخدامه بشكل مجاني.\n\ يركز تطبيقنا على توجيه ودعم أولئك الاشخاص \n\  العازمين على دخول عالم الاتصالات المعززة والبديلة. \n\ \n\  يدعم اللغة العربية.",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ],
              ),
            ),
          ),

        ]));
  }
}
