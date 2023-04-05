import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/pinCode.dart';
import 'package:flutter/services.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Stack(
        children: [
        Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        color: Color(0xFF89BFE7),
    borderRadius: BorderRadius.circular(0),
    shape: BoxShape.rectangle,
    ),

          child: Stack(
              children: [
          Padding(
          padding: const EdgeInsets.all(10),
            child: Container(
                alignment: AlignmentDirectional(0.88, -0.95),
                child:  FloatingActionButton.small(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );

                  },
                  backgroundColor: Colors.blue[100],

                  child: const Icon(Icons.arrow_forward_ios),


                )
            )
        ),
                //_______________________________

            Align(
        alignment: AlignmentDirectional(0, 1.05),
        child: Container(
          width: double.infinity,
          height: 720,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
                //_______________________________
                Align(
                  alignment: AlignmentDirectional(0, 1.05),
                  child: Container(
                    width: double.infinity,
                    height: 720,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                //_______________________________

                 Align(
                  alignment: AlignmentDirectional(-0.03, -0.81),
                  child: Text(
                    'اعادة تعيين كلمة المرور',
                    style: TextStyle(
                      fontFamily: 'DGShamael',
                      color: Color(0xFFCCE6F4),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                     // useGoogleFonts: false,
                    ),
                  ),
                ),


                //_______________________________
                Align(
                  alignment: AlignmentDirectional(0, -0.49),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(33, 0, 33, 0),
                    child: Text(
                      'تحتوي كلمات المرور القوية على ارقام وحروف وعلامات ترقيم.. معرفة المزيد',
                      textAlign: TextAlign.end,
                      style:
                     TextStyle(
                        fontFamily: 'DGShamael',
                        fontWeight: FontWeight.normal,
                      //  useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                //_______________________________

                Align(
                  alignment: AlignmentDirectional(0.97, -0.31),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 33, 0),
                    child: Text(
                      'اكتب كلمة مرورك الجديدة',
                      textAlign: TextAlign.end,
                      style:
                     TextStyle(
                        fontFamily: 'DGShamael',
                      //  useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                //_______________________________

                Align(
                  alignment: AlignmentDirectional(0.97, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 33, 0),
                    child: Text(
                      'اكتب كلمة مرورك الجديدة مرة اخرى',
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(
                        fontFamily: 'DGShamael',
                       // useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                //_______________________________

           Align(
          alignment: AlignmentDirectional(0.70 , -0.2),
            child: Container(
            width: 300,
            child: TextFormField(
              autofocus: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
           ),
            //____________________________________
                Align(
                  alignment: AlignmentDirectional(0.70 , 0.2),
                  child: Container(
                    width: 300,
                    child: TextFormField(

                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            //___________________

                Align(//Button
                  alignment: AlignmentDirectional(0.2, 0.5),
                   child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(250, 50),
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        backgroundColor: Color(0xFF89BFE7),
                        foregroundColor: Colors.white,


                        side: BorderSide(
                          width: 1,
                          color: Color(0xFF89BFE7),
                        ),

                        textStyle: const TextStyle(
                           fontFamily: 'DGShamael',
                           fontWeight: FontWeight.bold ,
                           fontSize: 16,
                      //     useGoogleFonts: false,
                        ),
                      ),//StyleForm

                     onPressed: () {

                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => PinCode()),
                       );
                     },//OnPressed

                      child: Text('اعادة تعيين'),

                    ),
                ),//Button Align
              //________________________________

              ]//Children Stack
        ), //StackWhite
        ),
        ],
    ),//StackBlue
    );
  }//Widget build(BuildContext context)
}



