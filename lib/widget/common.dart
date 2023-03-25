import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/utils/asset_path.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/icons.dart';

class CustomText extends StatelessWidget {

  final String text;
  final Color? fontcolor;
  final TextAlign textAlign;
  final FontWeight fontweight;
  final bool underlined,linethrough;
  final String? fontFamily;
  final double fontsize;
  final double? line_spacing;
  final int? max_lines;
  final double textScaleFactor;
  final bool isSp;
  //final double minfontsize,scalefactor,fontsize;

  const CustomText({Key? key,this.text="",this.fontcolor=Colors.black,this.fontsize=15,
    this.textAlign=TextAlign.start, this.fontweight=FontWeight.normal,
    this.underlined=false,

     this.line_spacing=1.2,this.isSp=true,
    this.max_lines,//double line_spacing=1.2,
    this.fontFamily,
    this.linethrough=false,this.textScaleFactor=1.0,
    // this.minfontsize=10,//this.scalefactor,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    //  double text_scale_factor=(media.size.width*media.size.height)/328190;
    //print("new text scale factor: ${text_scale_factor}");
    return Text(text,//textScaleFactor: textScaleFactor,
      maxLines: max_lines,
      overflow: max_lines!=null?TextOverflow.ellipsis:TextOverflow.visible,
      textAlign:textAlign,
      style:textStyle,
    );
  }


  TextStyle get textStyle => TextStyle(color: fontcolor,fontWeight: fontweight,
    height: line_spacing, fontSize: isSp?fontsize.sp:fontsize,
  fontFamily: fontFamily,
  decorationThickness: 2.0,
  decoration: underlined?TextDecoration.underline:(linethrough?TextDecoration.lineThrough:
  TextDecoration.none),);

}

class CustomImage extends StatelessWidget{

  final String? image;
  final BoxFit fit;
 // final String placeholder;
  final ImageType imageType;
  const CustomImage({required this.image,this.fit= BoxFit.contain,
    this.imageType=ImageType.TYPE_ASSET,});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (con,cons){
        return Container(
          child: imageType==ImageType.TYPE_NETWORK?
          Container():imageType==ImageType.TYPE_FILE?Image.file(File(image??""),
            fit: fit,errorBuilder: (_,__,___){
              return Container();
            },):
          imageType==ImageType.TYPE_ASSET?Image.asset(image??"",fit: fit,):
          Container(),
        );
      },
    );
  }
}


class CustomAutosizeText extends CustomText {

  final double minfontsize;
  const CustomAutosizeText({Key? key,String text="",Color fontcolor=Colors.black,
    double fontsize=15,this.minfontsize=12,
    TextAlign textAlign=TextAlign.start, FontWeight fontweight=FontWeight.normal,
    bool underlined=false,
    double line_spacing=1.2,bool isSp=true,
    int? max_lines,
    String? fontFamily,
    bool linethrough=false,double textScaleFactor=1.0,}) : super(key: key,
      text: text,fontcolor: fontcolor,fontsize: fontsize,textAlign: textAlign,
  fontweight: fontweight,underlined: underlined,line_spacing: line_spacing,
    isSp: isSp,max_lines: max_lines,fontFamily: fontFamily,linethrough: linethrough,
  textScaleFactor: textScaleFactor,);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text, maxLines: max_lines,//maxFontSize: fontsize,
        minFontSize: minfontsize,
        overflow: max_lines!=null?TextOverflow.ellipsis:TextOverflow.visible,
        textAlign:textAlign,
        style:textStyle
    );
  }
}

class ShadowContainer extends StatelessWidget {
  final double elevation;
  final Widget child;
  final double radius;
  const ShadowContainer({Key? key,this.elevation=5,required this.child,
    this.radius=0,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(elevation: elevation,shadowColor: AppColor.COLOR_GREY3,
      color: AppColor.COLOR_TRANSPARENT,
      borderRadius: BorderRadius.circular(radius),clipBehavior: Clip.antiAlias,
      child: child,);
  }
}

class CustomIconButton extends StatelessWidget {
  final ResizableIcon icon;
  final void Function()? onTap;
  const CustomIconButton({Key? key,required this.icon,this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Material(
        color: AppColor.COLOR_TRANSPARENT,
        child: IconButton(icon: Container(
          //   color: AppColor.COLOR_RED1,
            child: buildIcon()),
          onPressed:onTap,iconSize: icon.getSize,
        )));

  }

  Widget buildIcon(){
    return icon as Widget;
  }
}

class ButtonClose extends CustomIconButton{

  static final double _size=AppDimen.BTN_CLOSE_SIZE.h;

  ButtonClose({final void Function()? onTap,double? size,
    Color color=AppColor.COLOR_BLACK,}):super(icon: IconClose(
    color: color,size: size??_size,
  ),onTap: onTap);


}



enum ImageType{
  TYPE_ASSET,TYPE_FILE,TYPE_NETWORK
}