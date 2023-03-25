import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../StartUp.dart';

void main() => runApp(const MaterialApp(
  home: SignIn(),


));
class SignIn extends StatefulWidget {
  const SignIn ({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _HomeState();
}

class _HomeState extends State<SignIn> {


  bool isSignupScreen= true;
  int index = 0;
  @override


  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueAccent[100],
      body: Stack(

          children:[




            Positioned(
              top: 40,
              child: Row(
              children:  <Widget>[

                const Image(
                    height: 210,
                    width: 230,
                    fit: BoxFit.cover,
                    image:AssetImage('lib/assets/Picture1.png')
                ),

                  Text(
                    isSignupScreen ? ' تسجيل' : 'تسجيل \n دخول',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'IndieFlower',

                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        child:  FloatingActionButton.small(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignIn()),
                              );

                            },
                            backgroundColor: Colors.blue[100],

                            child: const Icon(Icons.arrow_forward_ios),


                        )
                    )
                ),







              ],



            ),
            ),

            Stack(
              children: [

              Positioned(
              top: 250,
                right: 0,
                left: 0,
                child:buildSignupSection(context),
              ),
                Positioned(
                  top: isSignupScreen? 570: 770,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Container(
                        height: 90,
                        width:90,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),

                        child: Container(

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors:
                                [Colors.blueAccent.shade200, Colors.lightBlueAccent.shade200]),
                              borderRadius: BorderRadius.circular(30),

                              ),
                          child: const Icon(Icons.arrow_forward, color: Colors.white,),


                        ),

                      ),


                    )),
                if(!isSignupScreen)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70),


                    child: Row(
                      children: [
                        TimelineTile(
                            alignment: TimelineAlign.manual,
                            lineXY: 0.4,


                            axis: TimelineAxis.horizontal,
                            indicatorStyle: IndicatorStyle(


                              color: index == 0 ? Colors.lightBlue: Colors.lightBlueAccent.shade100,
                              height: 30,
                              width: 40,
                              iconStyle: IconStyle(
                                color: Colors.white,
                                iconData: index ==0 ? Icons.circle_rounded :Icons.check,
                              ),
                            ),
                            isFirst: true,
                            afterLineStyle: LineStyle(
                                color: index > 0 ? Colors.green : Colors.grey
                            )
                        ),

                      ],

                    ),
                  ),



              ],






            ),










            ],





          ),










    );



  }

  Center buildSignupSection(BuildContext context) {
    return Center(


              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40),

                ),
                child: Container(

                  height: isSignupScreen? 380 : 570,
                  width: MediaQuery.of(context).size.width-20,

                  padding: const EdgeInsets.only(top: 22),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3), offset: Offset(5.0, 5.0),
                            blurRadius: 95,
                            spreadRadius: 95,
                        )
                      ]
                  ),



                  child: Column(


                    children: [
                      
                      Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSignupScreen= false;
                                });
                              },

                              child: Column(
                                children: [

                                  Text(
                                    'تسجيل دخول',
                                    style: TextStyle(
                                      fontFamily: 'DGShamael',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen? Colors.grey : Colors.blue ,

                                    ),
                                  ),
                                  if(!isSignupScreen)
                                    Container(
                                      height: 5,
                                      width: 60,
                                      color:Colors.blue[300],
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSignupScreen= true;
                                });
                              },
                              child: Column(
                                children: [

                                  Text(
                                    'تسجيل ',
                                    style: TextStyle(
                                      fontFamily: 'DGShamael',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen? Colors.blue : Colors.grey ,

                                    ),


                                  ),
                                  if(isSignupScreen)
                                    Container(

                                      height: 5,
                                      width: 60,
                                      color:Colors.blue[300],
                                    ),

                                ],
                              ),
                            )
                          ]
                      ),
                      const SizedBox(height:70),

                      if(isSignupScreen)

                      Column(

                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(


                              decoration :const  BoxDecoration(
                                color: Colors.white,

                              ),

                              child:Container(


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
                                ),
                              ),
                            ),
                          ),


                        ]

                      ),


                      const SizedBox(height: 26),
                      if(isSignupScreen)

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: 60,
                          decoration :const BoxDecoration(
                            color: Colors.white,



                          ),
                          child:Container(
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

                                hintText:'الرقم السري',
                                hintStyle: TextStyle(fontFamily: 'DGShamael',
                                    fontSize: 15 ),
                                suffixIcon: Icon(Icons.password),

                                labelText: "الرقم السري",
                                labelStyle: TextStyle(fontFamily: 'DGShamael',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                floatingLabelBehavior: FloatingLabelBehavior.always,



                              ),
                            ),
                          ),
                        ),
                      ),
                      if(!isSignupScreen)

                        Column(
                          children: [

                            Column(
                              children: [
                                Container(
                                  padding:const EdgeInsets.symmetric(vertical: 20),

                                )
                              ],

                            ),
                            const SizedBox(height: 26),



                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 12),
                                child: Container(
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

    hintText:'البريد الالكتروني',
    hintStyle: TextStyle(fontFamily: 'DGShamael',
    fontSize: 15 ),
    suffixIcon: Icon(Icons.email),

    labelText: "البريد الالكتروني",
    labelStyle: TextStyle(fontFamily: 'DGShamael',
    fontSize: 20,
    fontWeight: FontWeight.bold),
    floatingLabelBehavior: FloatingLabelBehavior.always,



    ),
    ),

                                ),
                              ),


                          ],

                        ),
                      SizedBox(height: 25),
                      if(!isSignupScreen)
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
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

                              hintText:'الرقم السري',
                              hintStyle: TextStyle(fontFamily: 'DGShamael',
                                  fontSize: 15 ),
                              suffixIcon: Icon(Icons.password),

                              labelText: "الرقم السري",
                              labelStyle: TextStyle(fontFamily: 'DGShamael',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              floatingLabelBehavior: FloatingLabelBehavior.always,



                            ),
                          ),
                        ),
                      )

                    ],

                  ),



                ),


              ),


            );
  }
}