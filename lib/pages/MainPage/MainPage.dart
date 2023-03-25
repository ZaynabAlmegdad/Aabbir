import 'package:flutter/material.dart';
import 'package:untitled2/utils/constants.dart';

void main() => runApp(const MaterialApp(
  home: MainPage(),


));
class MainPage extends StatefulWidget {

  const MainPage ({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 9, right: 9),
          child: Column(
            children: [
              Row(
                children: [
                  //remove or delete one pictogram.
                  Positioned(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12),


                      ),

                      padding: const EdgeInsets.all(10),
                      child: const Icon(

                        Icons.highlight_remove_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  //delete all
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(

                      Icons.redo,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  //redo
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(

                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  //go to the home page or the dashboard
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(

                      Icons.house,
                      color: Colors.white,
                    ),
                  ),


                ],


              ),
              SizedBox(height: 25),
              //Preview bar
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.shade900,
                      width: 3
                    )
                  ),
                  padding: EdgeInsets.symmetric(vertical: 35),
                ),
              ),
             SizedBox(height: 13,),
             Padding(
               padding: const EdgeInsets.only(top: 15, left: 9, right: 9),
               child: Row(
                 children: [
                    Container(
                       width: 83,
                       height: 30,
                       decoration: BoxDecoration(
                         color: Colors.brown.shade100,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                       ),
                      alignment: Alignment.center,
                      child: Container(

                        width: 40,
                        height: 12,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade200,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                        ),
                      ),
                    ),
                   SizedBox(width: 12,),

                   Container(
                     width: 83,
                     height: 30,
                     decoration: BoxDecoration(
                         color: Colors.pink.shade200,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                     ),
                     alignment: Alignment.center,
                     child: Container(

                       width: 40,
                       height: 12,
                       decoration: BoxDecoration(
                           color: Colors.pink.shade300,
                           borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                       ),
                     ),
                   ),

                   SizedBox(width: 12,),

                   Container(
                     width: 83,
                     height: 30,
                     decoration: BoxDecoration(
                         color: Colors.purple.shade200,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                     ),
                     alignment: Alignment.center,
                     child: Container(

                       width: 40,
                       height: 12,
                       decoration: BoxDecoration(
                           color: Colors.purpleAccent.shade200,
                           borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                       ),
                     ),
                   ),

                   SizedBox(width: 12,),

                   Container(
                     width: 83,
                     height: 30,
                     decoration: BoxDecoration(
                         color: Colors.blue.shade200,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                     ),
                     alignment: Alignment.center,
                     child: Container(

                       width: 40,
                       height: 12,
                       decoration: BoxDecoration(
                           color: Colors.blue.shade500,
                           borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),)
                       ),
                     ),
                   ),


                 ],
               ),
             ),

            ],

          ),

        ),
      ),
    );
  }
}