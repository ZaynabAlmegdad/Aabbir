import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:flutter/services.dart';
class PinCode extends StatefulWidget{
  const PinCode({Key? key}) : super(key: key);

  @override
  State<PinCode> createState() => _PinCodeState();


}

class _PinCodeState extends State<PinCode>{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(

      width: 400,
      height: 892,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        shape: BoxShape.rectangle,
      ),

      child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -0.83),
              child: Text(
                'نحتاج للتأكد من هويتك.. تفقد هاتفك',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'Aabbir font',
                 fontWeight: FontWeight.bold,
                 // useGoogleFonts: false,
                ),
              ),
            ),
            //___________
            Align(
              alignment: AlignmentDirectional(0, -0.65),
              child: Text(
                'ادخل الرمز المُرسل عبر رقم هاتفك..',
                style: TextStyle(
                  fontFamily: 'Aabbir font',
                //  useGoogleFonts: false,
                ),
              ),
            ),
            //___________
            Align(
              alignment: AlignmentDirectional(0, -0.47),
              child: Text(
                '+966 ** *** *** **08',
                style: TextStyle(
                  fontFamily: 'Aabbir font',
                  //useGoogleFonts: false,
                ),
              ),
            ),
            //______________PinCode

            Align(
              alignment: AlignmentDirectional(0, -0.11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
              SizedBox(//One
                height: 55,
                width: 55,
                child: TextFormField(
                  onSaved: (Pin1){},
                  onChanged: (value){
                    if (value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },//OnChange
                style: Theme.of(context).textTheme.titleLarge,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                ),
              ),

                 SizedBox(//Two
                   height: 55,
                   width: 55,
                   child: TextFormField(
                     onSaved: (Pin2){},
                     onChanged: (value){
                       if (value.length==1){
                         FocusScope.of(context).nextFocus();
                       }
                     },
                     style: Theme.of(context).textTheme.titleLarge,
                     keyboardType: TextInputType.number,
                     textAlign: TextAlign.center,
                     inputFormatters: [
                       LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly,
                     ],
                   ),
                 ),

                 SizedBox(//Three
                   height: 55,
                   width: 55,
                   child: TextFormField(
                     onSaved: (Pin3){},
                     onChanged: (value){
                       if (value.length==1){
                         FocusScope.of(context).nextFocus();
                       }
                     },
                     style: Theme.of(context).textTheme.titleLarge,
                     keyboardType: TextInputType.number,
                     textAlign: TextAlign.center,
                     inputFormatters: [
                       LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly,
                     ],
                   ),
                 ),

                 SizedBox(//Four
                   height: 55,
                   width: 55,
                   child: TextFormField(
                     onSaved: (Pin4){},
                     onChanged: (value){
                       if (value.length==1){
                         FocusScope.of(context).nextFocus();
                       }
                     },
                     style: Theme.of(context).textTheme.titleLarge,
                     keyboardType: TextInputType.number,
                     textAlign: TextAlign.center,
                     inputFormatters: [
                       LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly,
                     ],
                   ),
                 ),
            ],//Children
              ),
               ),


            //__________Button

            Align(//Button
              alignment: AlignmentDirectional(0.03, 0.45),
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
                    fontFamily: 'Aabbir font',
                    fontWeight: FontWeight.bold ,
                    fontSize: 16,
                    //     useGoogleFonts: false,
                  ),
                ),//StyleForm

                onPressed: () {
                showDialog(
                  context: context,
                  builder: (context)=> AlertDialog(
                  title: Text('تم اعادة تعيين كلمة مرورك ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aabbir font',
                      fontWeight: FontWeight.bold,
                      // useGoogleFonts: false,
                    ),
                  ) ,
                  content:  Text('تم اعادة تعيين كلمة مرورك بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aabbir font',
                      fontWeight: FontWeight.normal,
                      // useGoogleFonts: false,
                    ),
                  ),
                  actions: [
                    TextButton(//AlertButton

                      style: TextButton.styleFrom(
                        minimumSize: Size(250, 50),
                        alignment: Alignment.center,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        backgroundColor: Color(0xFF89BFE7),
                        foregroundColor: Colors.white,

                        side: BorderSide(
                          width: 1,
                          color: Color(0xFF89BFE7),
                        ),

                        textStyle: const TextStyle(
                          fontFamily: 'Aabbir font',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          //     useGoogleFonts: false,
                        ),
                      ),//StyleForm
                        onPressed: (){},
                        child: Text('حسنا'),
                    ),
                  ],//Action
                ),
                );//Show dialog
                },//OnPressed

                child: Text('المتابعة' ),
            ),
            ),
            //________________

          ],//Children
      ),
      ),
    );

  }//Widget build
}//Class






