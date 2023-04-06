import 'package:flutter/material.dart';
import 'main.dart';
class UsersInfo extends StatefulWidget {
  const UsersInfo({Key? key}) : super(key : key);
  @override
  State<UsersInfo> createState() => _UsersInfo();
}

class _UsersInfo extends State<UsersInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
          Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF89BFE7),
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
      //___________


      Align(
        alignment: const AlignmentDirectional(0, 1.05),
        child: Container(
          width: double.infinity,
          height: 720,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      //___________
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        alignment: AlignmentDirectional(-0.88, -0.95),
                        child:  FloatingActionButton.small(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );

                          },
                          backgroundColor: Colors.blue[100],

                          child: const Icon(Icons.person),


                        )
                    )
                ),
                ),
                //_________________
      Align(
        alignment: const AlignmentDirectional(0, -0.50),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
          child: TextFormField(
            //controller: _model.textController,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'بحث عن مستخدم ',
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xBF57636C),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x48FFFFFF),
                  width: 200,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x48FFFFFF),
                  width: 200,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 200,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 200,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
            //    style: FlutterFlowTheme.of(context).bodyMedium,
            // validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
      ),


      const Align(
        alignment: AlignmentDirectional(-0.03, -0.81),
      child: Text(
      'إدارة المستخدمين ',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      ),
    ),
      ),

              ],//Children Work
          ),
          )
          ],//Children1
      ),
    );


  }//Widget build(BuildContext context)
}//class _UsersInfo extends State<UsersInfo>