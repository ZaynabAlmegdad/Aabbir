import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/StartUp.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
        minTextAdapt: true,splitScreenMode: true,
        builder: (con,wid) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              builder: (context,widget){
               return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
            //    return widget!;
              },
            home: Home(),
             // home: MainPage(),

          );
        });
  }

}




