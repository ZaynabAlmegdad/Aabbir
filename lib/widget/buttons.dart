import 'package:flutter/material.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/common.dart';

import 'icons.dart';

class CustomButton extends StatelessWidget{

  final String? text;
  final Color? textColor,bgColor;
  final void Function()? onTap;
  final double fontsize;
  late double _radius;
  final EdgeInsets? padding;
  final BorderSide border;
  CustomButton({this.text,this.textColor=AppColor.COLOR_WHITE,
    this.bgColor=AppColor.THEME_COLOR_PRIMARY1,this.onTap,
    double? radius,
    this.fontsize=14,this.border=const BorderSide(width: 0,color: AppColor.COLOR_TRANSPARENT),
    this.padding,
  }){
    _radius=radius??AppDimen.LOGIN_BUTTON_RADIUS.r;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),border: Border.fromBorderSide(border),
        color: bgColor,
      ),
      child: Material(color: AppColor.COLOR_TRANSPARENT,
        child: InkWell(onTap: onTap,child: Padding(
          padding: padding??EdgeInsets.symmetric(
              vertical: AppDimen.LOGIN_BUTTON_VERT_PADDING.h),
          child: child,
        ),),
      ),);
  }


  @override
  Widget get child{
    return CustomText(text: text??"",fontcolor: textColor,fontsize: fontsize,
      textAlign: TextAlign.center,
      fontweight: FontWeight.bold,);
  }

}


class ArrowButton extends StatelessWidget {

  final String image;
  final void Function()? onTap;
  final Color bgColor;
  final bool left;
  final double iconsize;
  const ArrowButton({Key? key,required this.image,this.onTap,this.left=true,
    required this.iconsize,
    this.bgColor=AppColor.COLOR_WHITE}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius=10.r;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: left?BorderRadius.only(topLeft: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),):
        BorderRadius.only(topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),),color: bgColor,
    ),
      child: Material(
      color: AppColor.COLOR_TRANSPARENT,
      child: InkWell(
      onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 3),
          child: CustomMonoIcon(icon: image,size: iconsize,),
        ),
      ),),);
  }
}


class ActionButton extends StatelessWidget {

  final String image;
  final void Function()? onTap;
  final double iconsize;
  final bool selected;
  final bool show;
  const ActionButton({Key? key,required this.image,this.onTap,this.selected=false,
    required this.iconsize,this.show=true,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius=8.r;
  //  final double size=20.h;
    return AnimatedScale(scale: show?1:0,
      duration: const Duration(milliseconds: AppInteger.STANDARD_DURATION_MILLI,),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: selected?AppColor.COLOR_ORANGE2:AppColor.COLOR_WHITE.withOpacity(0.4),
            borderRadius: BorderRadius.circular(radius)),
        child: Material(
        color: AppColor.COLOR_TRANSPARENT,
        child: InkWell(onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(7.h),
       //   padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
          child: CustomMonoIcon(icon: image,size: iconsize,
            color: AppColor.BG_COLOR,),
        ),),),),
    );
  }
}
