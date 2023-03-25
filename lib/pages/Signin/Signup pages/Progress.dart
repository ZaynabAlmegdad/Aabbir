import 'package:flutter/material.dart';


class PForm extends StatefulWidget {
  final List<Widget> pages;
  final List<PTitle> title;
  PFormController controller;
  Color activeColor, disableColor;

  PForm({required this.pages, required this.title,
    required this.controller, this.activeColor = Colors.blue,
    this.disableColor = Colors.grey});

  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin  {
   List<AnimationController> _controllers = <AnimationController>[];
   List<Animation<double>> _animation = <Animation<double>>[];
   List<Animation<double>> _animationOpacity = <Animation<double>>[];
   late List<bool> ActiveColor;
  @override
  void initState(){
    super.initState();
    _controllers = List.generate(widget.pages.length , (index) =>
        AnimationController(vsync: this, duration: Duration(milliseconds: 200) , lowerBound: .1));
    _animation = _controllers.map((_controllers) =>
        Tween<double>(begin: .05, end: 1).animate(_controllers)).toList();
    _animationOpacity = _controllers.map((_controllers) =>
        Tween<double>(begin: 0, end: 1).animate(_controllers)).toList();
    ActiveColor = List.generate(widget.pages.length, (index) => false);

    if (widget.controller != null)(
    widget.controller.addListener(() {
      controlColor(widget.controller.currentPage);
    }));




  }
  controlColor(int index){
    for(var i = 0; i < ActiveColor.length; i++){
      for(var i = 0; i < widget.pages.length; i++){
        if(index == i){
          _controllers[index].animateTo(1);
        }else{
          if(_controllers[i].isCompleted)
            _controllers[i].reverse();
        }
      }
      for (var i = 0; i<= index; i++){
        ActiveColor[i]= true;
      }
      for (var i = index+1; i< ActiveColor.length; i++){
        ActiveColor[i]= false;
      }
      setState(() {

      });
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllers.forEach((c) {
      c.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.pages.map((e){
            int index = widget.pages.indexOf(e);
            return Stack(
            children:[
             if(index != widget.pages.length - 1)
              Container(
                margin: EdgeInsets.only(left: 2, top: 37),
                child: SizeTransition(
                  sizeFactor: _animation[index],
                  child: Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    width: 3,
                    height: 300,
                      color: ActiveColor[index+1]
                          ? Colors.blueAccent : Colors.grey
                  ),
                ),
              ),

              Column(
                children: [

                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          controlColor(index);

                        },
                       child: Container(
                         width: 35,
                         height: 35,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: ActiveColor[index]
                                 ? Colors.blueAccent : Colors.grey
                         ),
                       ),
             ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: FadeTransition(opacity: _animationOpacity[index],
                          child: SizeTransition(
                            sizeFactor: _animation[index],
                            child: e,
                          ),
                          )
                      )
                    ],
                  )
                ],
              )

            ]

            );

      }).toList(),
    ),
    );
  }
}
class PTitle extends StatelessWidget {
  String title, subTitle;
  Colors ActiveColors;
  PTitle({required this.ActiveColors, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    if(ActiveColors == null) ActiveColors = Colors.black as Colors;
    return Column(
      children: [
        Text(title, style:  TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'DGShamael',


        ),)
      ],
    );
  }
}

class PFormController extends ChangeNotifier{
  PFormController(this.length);
  int _page = -1;
  final int length;

  nextPage(){
    if (_page < length - 1) _page++;

    notifyListeners();
  }
  get currentPage => _page;

  set jumpToPage (int p) {
    _page = p;
     notifyListeners();
  }
  prePage(){
    if (_page > 0) _page--;
    notifyListeners();
  }
}

