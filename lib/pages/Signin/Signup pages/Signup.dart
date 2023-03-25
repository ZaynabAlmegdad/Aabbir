import 'package:flutter/material.dart';
import '../../../StartUp.dart';
import 'package:untitled2/pages/Signin/Signup%20pages/Progress.dart';
import 'package:untitled2/pages/Signin/Signup%20pages/Page1.dart';
import 'package:untitled2/pages/Signin/Signup%20pages/page2.dart';
import 'package:untitled2/pages/Signin/Signup%20pages/Page3.dart';
import 'package:untitled2/pages/MainPage/MainPage2.dart';
/*
void main() => runApp(const MaterialApp(
  home: SignIn(),


));*/
class SignIn extends StatefulWidget {

  const SignIn ({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _HomeState();
}

class _HomeState extends State<SignIn> {
  late PFormController pFormController;
  @override
  void initState(){
    // TODO: implement initiate
    super.initState();
    pFormController = PFormController(3);
  }
  bool isSignupScreen= true;
  bool isRememberMe=false;
  bool isRead = false;
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
                //go back to home page
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        child:  FloatingActionButton.small(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Home()),
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
                top: 240,
                right: 0,
                left: 0,
                child:buildSignupSection(context),
              ),
              // blue arrow button at the eend
              if(isSignupScreen)
              Positioned(
                  top:  570,
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

                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            //const MainPage()
                              MainPage()
                            ),
                          );

                        },
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

                    ),


                  )),

            ],
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          if(!isSignupScreen)
          InkWell(
            onTap: (){
              pFormController.prePage();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)
              ) ,
              child: Icon(Icons.arrow_back, color: Colors.white,),
            ),
          ),
          SizedBox(width:20),
          if(!isSignupScreen)
          InkWell(
            onTap: (){
              pFormController.nextPage();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)
              ) ,
              child: Icon(Icons.arrow_forward, color: Colors.white,),
            ),
          ),

        ],
      ) ,
    );
  }

  Center buildSignupSection(BuildContext context) {
    return Center(
        child: ClipRRect(

            borderRadius: const BorderRadius.all(Radius.circular(40),

            ),
            child: Container(

              height: isSignupScreen? 380 : 670,
              width: MediaQuery.of(context).size.width-20,

              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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

                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    //sinup or signin buttons
                    Container(

                      child: Row(
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
                    ),
                    const SizedBox(height:70),

                    //if the user clicked on the sign in button
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
                                  //email textfield


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
                            const SizedBox(height: 26),
                            if(isSignupScreen)
                              //password textfield
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
                            Row(

                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Checkbox(
                                      value: isRememberMe,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setState(() {
                                          isRememberMe = !isRememberMe;
                                        });


    }
                                  ),
                                ),
                                   Container(
                                     child: Text("تذكرني",
                                  style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DGShamael',
                                       ),
                                            ),
                                   ),
                                SizedBox(width: 52),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: TextButton(
                                      onPressed: (){},
                                      child: Text('هل نسيت الرقم السري؟',
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.grey.shade600,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'DGShamael',
                                        ),

                                      )),
                                )

                              ],
                            )


                          ]

                      ),

                    //if the user clicked on the sign up button
                    if(!isSignupScreen)

                    PForm(
                      controller: pFormController,

                      pages: [
                        Page1(),
                        Page2(),
                        Page3(),
                      ],
                      title: [


                      ],
                     


                    ),


                  ]
              ),
            )
        )
    );
  }
}