import 'package:flutter/material.dart';
import 'package:untitled2/Dashboard/dashboard.dart';


void main() => runApp(const MaterialApp(
  home: policy(),
));

class policy extends StatefulWidget {
  const policy({Key? key}) : super(key: key);

  @override
  State<policy> createState() => _policy();
}

class _policy extends State<policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: Stack(
        children: [
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
            top: 120,
            right: 100,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    "سياسة الخصوصية",
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
            top: 190,
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
            top: 220,
            right: 0,
            left: 13,
            child: Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/cliparts/Logo.png'))),
            ),
          ),
          /*Positioned(
            top: 305,
            right: 10,
            child: Container(
              height: 28,
              width: 28,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assests/pol.jpg'))),
            ),
          ),*/
          Positioned(
            top: 290,
            right: 30,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    ":التزامنا بمراعاة خصوصيتك",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff930303),
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 340,
            right: 30,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    ".إننا نهتم بشكل كبير بخصوصية زوار برنامجنا، ونتعهد بحمايتها \n\ .تشرح هذه السياسة كيفية التصرف في معلوماتك الشخصية ",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 405,
            right:30,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    "بموافقتك على استخدامنا لملفات تعريف الارتباط وفقًا لبنود هذه السياسة \n\  فإنك تسمح لنا باستخدام ملفات تعريف الارتباط في كل مرة تزور فيها \n\  .البرنامج",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 490,
            right: 30,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    "تنطبق سياسة حماية الخصوصية المعتمدة من قبلنا على كل المعلومات\n\  الشخصية التي يتم جمعها من قبلنا أو يتم تقديمها لنا، ومن خلال تقديمكم\n\ المعلومات الشخصية لنا، توافقون على أحكام وشروط هذه السياسة.",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 220,
            right: 30,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    ":المعلومات الشخصية  ",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right:30,
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    "المعلومات الشخصية التي يتم تجميعها هي المعلومات التي تعرّف عنكم \n\كأفراد، وتشمل : الاسم، اسم المستخدم، البريد الالكتروني،رقم الهاتف،\n\   معلومات حول المتصفّح والجهاز، المعلومات التي يتم جمعها من خلال\n\ ملفات تعريف الارتباط وبيانات البيكسل الإضافية والتقنيات الأخرى. ",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: 'DGShamael',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
