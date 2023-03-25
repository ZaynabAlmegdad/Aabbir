import 'package:flutter/material.dart';
import 'package:untitled2/pages/Signin/Signup%20pages/Signup.dart';



class TProgress extends StatelessWidget {
  const TProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 12),
        child: const TextField(
          textAlign:TextAlign.right,

          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue,
                    width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey,
                    width: 2)
            ),

            hintText:'البريد الألكتروني',
            hintStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 15 ),
            suffixIcon: Icon(Icons.email),
            labelText: "البريد الالكتروني",
            labelStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,



          ),
        )
    );
  }
}
class TProgress2 extends StatefulWidget {
  const TProgress2({Key? key}) : super(key: key);

  @override
  State<TProgress2> createState() => _TProgress2State();
}

class _TProgress2State extends State<TProgress2> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 12),
        child: const TextField(
          textAlign:TextAlign.right,

          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue,
                    width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey,
                    width: 2)
            ),

            hintText:'اسم المستخدم',
            hintStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 15 ),
            suffixIcon: Icon(Icons.account_circle),
            labelText: "اسم المستخدم",
            labelStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,



          ),
        )

    );
  }
}

class TProgress3 extends StatelessWidget {
  const TProgress3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 12),
        child: const TextField(
          textAlign:TextAlign.right,

          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue,
                    width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey,
                    width: 2)
            ),

            hintText:' الهاتف',
            hintStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 15 ),
            suffixIcon: Icon(Icons.phone),
            labelText: "الهاتف",
            labelStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,



          ),
        )
    );
  }
}
//Female & Male Radio Button
class TProgress5 extends StatefulWidget {
  const TProgress5({Key? key}) : super(key: key);

  @override
  State<TProgress5> createState() => _TProgress5State();
}
//Female & Male Radio Button
class _TProgress5State extends State<TProgress5> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 12),


      child: GestureDetector(
        onTap:(){
          isMale = true;
        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isMale = true;
                });
        },
              child: Row(
                children:[
                  SizedBox(width: 10),
                  Text("ذكر",
                  style: TextStyle(
                    fontFamily: 'DGShamael',
                    fontSize: 20,
                  ),),
                  SizedBox(width: 10),
                  Container(
                    width:30,
                    height:30,
                    decoration: BoxDecoration(


                      border: Border.all(
                        width: 3, color: isMale? Colors.blue : Colors.grey,),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Icon(
                        Icons.male_rounded
                    ),


                  ),

        ]

              ),
            ),
            SizedBox(width: 35),
            GestureDetector(
              onTap: (){
                setState(() {
                  isMale = false;
                });
              },
              child: Row(
                  children:[
                    Text("انثى",
                      style: TextStyle(
                        fontFamily: 'DGShamael',
                        fontSize: 20,
                      ),),
                  SizedBox(width: 10),
      Container(
        width:30,
        height:30,
        decoration: BoxDecoration(


          border: Border.all(
              width: 3, color: isMale? Colors.grey : Colors.blue,),
          borderRadius: BorderRadius.circular(15),

        ),
        child: Icon(
              Icons.female_rounded
        ),


      ),
      ]
              ),
            )

          ],
        ),

      ),


    );
  }
}
//Create Password textfield
class TProgress6 extends StatelessWidget {
  const TProgress6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 12),
        child: const TextField(
          textAlign:TextAlign.right,

          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue,
                    width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey,
                    width: 2)
            ),

            hintText:' الرقم السري',
            hintStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 15 ),
            suffixIcon: Icon(Icons.password),
            labelText: "الرقم السري",
            labelStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,



          ),
        )
    );
  }
}
//confitm password textfield
class TProgress7 extends StatelessWidget {
  const TProgress7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 12),
        child: const TextField(
          textAlign:TextAlign.right,

          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue,
                    width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey,
                    width: 2)
            ),

            hintText:' تأكيد الرقم السري',
            hintStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 15 ),
            suffixIcon: Icon(Icons.password),
            labelText: "الرقم السري",
            labelStyle: TextStyle(fontFamily: 'DGShamael',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,



          ),
        )
    );
  }
}
class TProgress8 extends StatefulWidget {
   TProgress8({Key? key}) : super(key: key);

  @override
  State<TProgress8> createState() => _TProgress8State();
}

class _TProgress8State extends State<TProgress8> {
  bool isRead= false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('نحتاج الى موافقتك',
                textAlign: TextAlign.right,


                style:TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                  fontFamily: 'DGShamael',

                )
            ),
            SizedBox(height: 10),
            Text('عند قبولك هذه الدعوة, سيتم انشاء حساب لك',
                textAlign: TextAlign.right,
                style:TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                  fontFamily: 'DGShamael',

                )
            ),
            SizedBox(height: 35),


             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );

              },


              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[100],

                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  textStyle: const TextStyle(
                      fontFamily: 'DGShamael',
                      fontSize: 40,
                      fontWeight: FontWeight.normal)),
              child: const Center(
                child: Text(
                  'سياسة الخصوصية',
                  style: TextStyle(fontSize: 20, color: Colors.white,   fontFamily: 'DGShamael'),
                ),


              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('قرأت الوثائق',
                  style: TextStyle(fontSize: 20,
                      color: Colors.black,   fontFamily: 'DGShamael'),
                ),
                Container(
                  child: Checkbox(
                      value: isRead,
                      activeColor: Colors.blue,
                      onChanged: (value){
                        setState(() {
                          isRead = !isRead;
                        });


                      }
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
class Tprogress9 extends StatelessWidget {
   Tprogress9({Key? key}) : super(key: key);
  bool isRead= false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
