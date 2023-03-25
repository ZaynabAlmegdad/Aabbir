import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/utils/constants.dart';

class AppMessage{
  static void showMessage(String message,{Toast length=Toast.LENGTH_SHORT}){
    Fluttertoast.showToast(msg: message, toastLength: length,);
  }

  static void handleException(dynamic ex){
    print("new exception: $ex");
    showMessage(ex.toString());
  }

}

class AppNavigator{

  static void navigateTo(BuildContext context,Widget widget,){
    Navigator.push(
      context,
      MaterialPageRoute(builder:
          (context) => widget,
      ),
    );
  }

  static void popUntil(BuildContext context,String route,){
    Navigator.popUntil(context, ModalRoute.withName(route));
  }

  static void navigateToReplace(BuildContext context,Widget navigate,){
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => navigate,),
    );
  }
/*  static void navigateToReplaceAll(Widget Function() navigate,){
    Navigator.popUntil(
      context, MaterialPageRoute(builder: (context) => navigate,),
    );
    Get.offAll(navigate,transition: transition,duration: Duration(milliseconds: duration));
    print("current route to replace all ${Get.currentRoute}");
  }*/

  static void pop<T>(BuildContext context,{T? value}){
    Navigator.pop(context);
  }

}


class AppDialog {

  static Future<T?> showDialog<T>(BuildContext context,Widget widget,
      {bool disable_back = false, bool backDrop=true,bool scrollable=true}) {
    return showGeneralDialog(context: context,
        barrierDismissible: false,
        barrierColor: backDrop?const Color(0x88000000,):AppColor.COLOR_TRANSPARENT,
        transitionDuration: const Duration(milliseconds: AppInteger.STANDARD_DURATION_MILLI),
        pageBuilder: (context, anim1, anim2) {
          return widget;
        }, transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: anim1, child: Opacity(
        opacity: anim1.value,
        child: WillPopScope(
          onWillPop: () async {
            return disable_back;
          },
          child: SafeArea(
            child: AlertDialog(
              scrollable: scrollable,
              backgroundColor: AppColor.COLOR_TRANSPARENT,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              /*   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),)
                  ),*/
              //useMaterialBorderRadius: true,
              //  title: Center(child: VariableText(text:"Payment",weight: FontWeight.bold,),),
              content: child,
            ),
          ),
        ),
      ),);
    });
    // Get.dialog(widget)
  }

  static Future<T?> showPlainDialog<T>(BuildContext context,
      Widget widget, {bool disable_back = false,bool backDrop=true,}) {
    return showGeneralDialog(context: context,
        barrierDismissible: false,
        barrierColor: backDrop?const Color(0x88000000,):AppColor.COLOR_TRANSPARENT,
        transitionDuration: const Duration(milliseconds: AppInteger.STANDARD_DURATION_MILLI),
        pageBuilder: (context, anim1, anim2) {
          return widget;
        }, transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: anim1, child: Opacity(
        opacity: anim1.value,
        child: WillPopScope(
          onWillPop: () async {
            return disable_back;
          },
          child: SafeArea(
            child: Material(
                color: AppColor.COLOR_TRANSPARENT,
                child: Center(child: child)),
          ),
        ),
      ),);
    });
    // Get.dialog(widget)
  }

  static Future<T?> showBottomPanel<T>(BuildContext context,Widget widget,){
    return showModalBottomSheet<T>(context: context, backgroundColor: AppColor.COLOR_TRANSPARENT,
        enableDrag: false,
        builder: (con){
          return widget;
        });
  }

  static Future<T?> showFullScreenBottomPanel<T>(BuildContext context,
      Widget widget,){
    return showModalBottomSheet<T>(context: context,
        backgroundColor: AppColor.COLOR_TRANSPARENT,
        isScrollControlled: true,
        enableDrag: false,
        constraints: BoxConstraints.expand(width: 1.sw,height: 0.9.sh),
        builder: (con){
          return widget;
        });
  }

}