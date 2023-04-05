import 'package:flutter/material.dart';
import 'package:untitled2/dashboard.dart';

void main() => runApp(const MaterialApp(
  home: profile(),
));

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: Stack(children: [
        Positioned(
          top: 20,
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
          top: 85,
          right: 93,
          child: Center(
            child: Row(
              children: <Widget>[
                Text(
                  "المـلـف الشـخـصـي",
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
          top: 160,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 800,
            width: MediaQuery.of(context).size.width - 0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                SizedBox(height: 60.0,),
                Row(
                    children:[
                      SizedBox(height: 50.0, width: 150.0,
                        child: TextFormField (
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(6.0),
                                borderSide: BorderSide(color: Colors.grey,
                                    width: 2)
                            ),
                            hintText: 'الاسم الأخير',
                            hintStyle: TextStyle(fontFamily: 'DGShamael',
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(height: 20.0),
                      SizedBox(
                        height: 50.0, width: 150.0,
                        child: TextFormField (
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(6.0),
                                borderSide: BorderSide(color: Colors.grey,
                                    width: 2)
                            ),
                            hintText: 'الاسم الأول',
                            hintStyle: TextStyle(fontFamily: 'DGShamael',
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal),

                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 40.0),
                SizedBox(
                  height: 50.0, width: 370.0,
                  child: TextFormField (
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.black87,),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: Colors.grey,
                              width: 2)
                      ),
                      hintText: 'البريد الالكتروني',
                      hintStyle: TextStyle(fontFamily: 'DGShamael',
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),

                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                SizedBox(
                  height: 50.0, width: 370.0,
                  child: TextFormField (
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call,color: Colors.black87),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: Colors.grey,
                              width: 2)
                      ),
                      hintText: 'رقم الهاتف',
                      hintStyle: TextStyle(fontFamily: 'DGShamael',
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                SizedBox(
                  height: 50.0, width: 370.0,
                  child: TextFormField (
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.female_sharp,color: Colors.black87),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: Colors.grey,
                              width: 2)
                      ),
                      hintText: 'الجنس',
                      hintStyle: TextStyle(fontFamily: 'DGShamael',
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),

                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                SizedBox(
                  height: 50.0, width: 370.0,
                  child: TextFormField (
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on,color: Colors.black87),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: Colors.grey,
                              width: 2)
                      ),
                      hintText: 'الدولـة',
                      hintStyle: TextStyle(fontFamily: 'DGShamael',
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),

                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Column(
                  children: [
                    Divider(color: Colors.black,thickness: 1.7,height:30,)// black line
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children:[
                    SizedBox(
                        height: 50.0, width: 150.0,
                        child: ElevatedButton(onPressed:(){},// reset password page
                            child: Text("تغيير كلمة المرور",
                                style: TextStyle(
                                    fontFamily: 'DGShamael',
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal))
                        )
                    ),
                    Spacer(),
                    SizedBox(
                      height: 50.0, width:180.0,
                      child: TextFormField (
                        textAlign: TextAlign.right,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_sharp,color: Colors.black87),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(6.0),
                              borderSide: BorderSide(color: Colors.grey,
                                  width: 2)
                          ),
                          hintText: '***********',
                          hintStyle: TextStyle(fontFamily: 'DGShamael',
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.0),
                SizedBox(
                    height: 50.0, width: 370.0,
                    child: ElevatedButton(
                      onPressed:(){}, //save changes
                      child: Text("حفظ التغييرات",
                          style: TextStyle(
                              fontFamily: 'DGShamael',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),



                    )
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
