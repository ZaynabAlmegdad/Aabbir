import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled2/pages/MainPage/MainPage2.dart';
import 'package:untitled2/service/local_database.dart';
import 'package:untitled2/service/voice_speaker.dart';
import 'package:untitled2/utils/actions.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/utils/word_data.dart';
import 'pages/Signin/Signup pages/Signup.dart';

void main() => runApp(const MaterialApp(
  home: Home(),


));
class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Timer? timer;

  @override
  void initState() {
    Proceed();
/*    timer=Timer(const Duration(seconds: AppInteger.SPLASH_DURATION_SEC), () async{

      Proceed();
    });*/
    super.initState();
  }

  @override
  void dispose() {
    //timer?.cancel();
    super.dispose();
  }

  void Proceed() async{
    await VoiceSpeaker().init();
    await checkData();
    await Future.delayed(const Duration(seconds:
    AppInteger.SPLASH_DURATION_SEC));
  //  AppNavigator.navigateTo(context, MainPage());
    AppNavigator.navigateTo(context, SignIn());
  }

  Future<void> checkData() async{
    final LocalDatabase database=await LocalDatabase.instance;
    print("is data: ${database.isData}");
    if(!database.isData){
      await database.writeinitialData(WordData.categories, WordData.words);
    }
    else{
      database.readData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent[100],
        body: Stack(
          children: [
            Positioned(
              top: 60,
                right: 190,
                left: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/SmallLogo.png')
                    )
                  ),
                ),
            ),
            Positioned(
              top: 100,
              right: 0,
              left: 100,
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/AabbirFont.png')
                    )
                ),
              ),
            ),

         Positioned(
           top: 465,

           child: Column(
             children: [

               Container(

                 height:  700,
                 width: 500,
                 decoration: BoxDecoration(
                     color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(100),
                 ),
                 )
               ),
             ],

           ),
         ),
            Positioned(
                top: 320,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/img.png')
                      )
                  ),
                )),
            Positioned(
                top:  230,
                right: 0,
                left: 10,

                  child: Center(
                    child: Row(

                      children:  <Widget>[
                        Text('مرحبا بكم في عبر \n\ دليل التواصل المعزز والبديل الخاص بك  \n\ حيث تستخدم رموز التواصل بالقاموس العربي ',
                    textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'IndieFlower',)
                        )
                      ],


                    ),
                  ),
                ),

            Positioned(
                top:  770,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    height: 90,
                    width:90,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent.shade100,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: InkWell(
                      onTap: (){
                       // Proceed();
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

        )


    );

  }


}