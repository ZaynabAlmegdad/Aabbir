import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(const MaterialApp(
  home: Dashboard(),


));
class Dashboard extends StatefulWidget {
  const Dashboard ({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Blue area
              Container(

                decoration: const BoxDecoration(
                  color: Color(0xFF508ACE),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),

                ),

                height: 100,

                child:
                const Center(
                    child:

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Aabbir', style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 8, 51, 94),
                          ),),
                          WidgetSpan(child: Icon(Icons.logout, size: 28, )),
                        ],
                      ),
                    )),


              ),


              const SizedBox(height: 24),
              // Dashboard
              Expanded(
                child: Container(

                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5),
                      ]),
                  child: gridView(context),
                ),
              ),
              const SizedBox(height: 24),

            ],
          ),
        ));
  }

  Widget gridView(BuildContext context) {
    Material MyItems(IconData icon, String heading, int color) {
      return Material(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(9.0),

// style
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // text
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  // icons
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        elevation: 14.0,
        shadowColor: const Color(0x802196F3),
      );
    }

    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        MyItems(Icons.manage_accounts, "     ادارة        \n المستخدمين", 0xffed622b),
        MyItems(Icons.home, "الصفحة الرئيسة", 0xff26cb3c),
        MyItems(Icons.edit, "ادارة الصور\n التوضيحية", 0xff7297ff),
        MyItems(Icons.person_pin, "الملف الشخصي", 0xfff4c83f),
      ],
      staggeredTiles: [
        const StaggeredTile.extent(1, 180.0),
        const StaggeredTile.extent(1, 180.0),
        const StaggeredTile.extent(1, 180.0),
        const StaggeredTile.extent(1, 180.0),
      ],
    );
  }
}