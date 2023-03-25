import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/common.dart';
import 'package:untitled2/widget/icons.dart';

mixin LoginFieldProps {
  TextEditingController? controller;
  late double radius,elevation;
  late String hinttext;
  String? prefixIcon;
  Widget? suffixIcon;
  String? Function(String? val)? onValidate;
  ValueChanged<String>? onSubmit;
  late bool hidden;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  late Color bgColor,hintColor;
  int? maxLength;
  late bool expands;
  late TextAlign textAlign;
  TextAlignVertical? textAlignVertical;
  late BorderSide border;
  late double fontsize;
  late bool readOnly,autofocus;
  TextInputAction? textInputAction;
  void Function()? onTap;
  void Function(String val)? onChange;
  FocusNode? focusNode;
  late Color iconColor,focusedBorderColor;
  late TextDirection textDirection;

  void initialize({TextEditingController? controller,
    double radius=AppDimen.LOGIN_FIELD_RADIUS,
    TextDirection textDirection=TextDirection.ltr,
    String hinttext="",String? prefixIcon,String? Function(String? val)? onValidate,
    bool hidden=false,bool autofocus=false,FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,TextInputType? keyboardType,
    Color bgColor=AppColor.COLOR_WHITE, Color hintColor=AppColor.COLOR_GREY1,
    Color iconColor=AppColor.THEME_COLOR_PRIMARY1,
    Color focusedBorderColor=AppColor.THEME_COLOR_PRIMARY1,
    int? maxLength,bool expands=false,ValueChanged<String>? onSubmit,
    double fontsize=AppDimen.FONT_TEXT_FIELD,bool readOnly=false,TextInputAction? textInputAction,
    TextAlign textAlign=TextAlign.start,TextAlignVertical? textAlignVertical,
    Widget? suffixIcon,void Function()? onTap,double elevation=0,
    void Function(String val)? onChange,
    BorderSide border= const BorderSide(width: 0,color: AppColor.COLOR_TRANSPARENT),}){
    this.controller=controller;
    this.radius=radius;
    this.hinttext=hinttext;
    this.prefixIcon=prefixIcon;
    this.onValidate=onValidate;
    this.hidden=hidden;
    this.inputFormatters=inputFormatters;
    this.keyboardType=keyboardType;
    this.bgColor=bgColor;
    this.hintColor=hintColor;
    this.maxLength=maxLength;
    this.expands=expands;
    this.fontsize=fontsize;
    this.readOnly=readOnly;
    this.textInputAction=textInputAction;
    this.textAlign=textAlign;
    this.textAlignVertical=textAlignVertical;
    this.suffixIcon=suffixIcon;
    this.border=border;
    this.onTap=onTap;
    this.elevation=elevation;
    this.autofocus=autofocus;
    this.focusNode=focusNode;
    this.onSubmit=onSubmit;
    this.onChange=onChange;
    this.iconColor=iconColor;
    this.focusedBorderColor=focusedBorderColor;
    this.textDirection=textDirection;
  }

}


class CustomField extends StatelessWidget with LoginFieldProps{

  static const errorColor=AppColor.COLOR_RED1;

  CustomField({Key? key,TextEditingController? controller,
    double radius=AppDimen.LOGIN_FIELD_RADIUS,
    String hinttext="",String? prefixIcon,String? Function(String? val)? onValidate,
    bool hidden=false,
    Color iconColor=AppColor.THEME_COLOR_PRIMARY1,
    Color focusedBorderColor=AppColor.THEME_COLOR_PRIMARY1,
    List<TextInputFormatter>? inputFormatters,TextInputType? keyboardType,
    Color bgColor=AppColor.COLOR_WHITE, int? maxLength,bool expands=false,
    bool autofocus=false,FocusNode? focusNode,ValueChanged<String>? onSubmit,
    double fontsize=AppDimen.FONT_TEXT_FIELD,bool readOnly=false,TextInputAction? textInputAction,
    TextAlign textAlign=TextAlign.start,TextDirection textDirection=TextDirection.ltr,
    TextAlignVertical textAlignVertical=TextAlignVertical.center,
    Widget? suffixIcon,void Function()? onTap,double elevation=0,Color hintColor=AppColor.COLOR_GREY2,
    void Function(String val)? onChange,
    BorderSide border=const BorderSide(width: 1, color: AppColor.COLOR_GREY2),}):
        super(key: key){
    initialize(controller: controller,radius: radius,hinttext: hinttext,prefixIcon: prefixIcon,
        onValidate: onValidate,hidden: hidden,inputFormatters: inputFormatters,keyboardType: keyboardType,
        bgColor: bgColor,maxLength: maxLength,expands: expands,fontsize: fontsize,readOnly: readOnly,
        textInputAction: textInputAction,
        autofocus:autofocus,focusNode: focusNode,
        textAlign: textAlign,textAlignVertical: textAlignVertical,
        onSubmit: onSubmit,textDirection:textDirection,
        suffixIcon: suffixIcon,border: border,onTap: onTap,
        onChange: onChange, iconColor:iconColor,
        focusedBorderColor:focusedBorderColor,
        hintColor: hintColor,elevation: elevation);
  }


  @override
  Widget build(BuildContext context) {
    final double font=fontsize.sp;
    //final double font=60.sp;
    var border=enabledBorder;

    return ShadowContainer(elevation: elevation,radius: radius,
      child: TextFormField(focusNode: focusNode,
        controller: controller,
        onChanged: onChange,textDirection: textDirection,
        onFieldSubmitted: onSubmit,
        onTap: onTap,autofocus: autofocus,
        textInputAction: textInputAction,
        readOnly: readOnly,
        validator: onValidate,
        maxLength: maxLength,
        obscureText: hidden,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        expands: expands,maxLines: expands?null:1,textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        style: TextStyle(fontSize: font,
            // height: 1
           // fontFamily: FontFamily.OUTFIT
        ),
        decoration: InputDecoration(
            counterText: "",isCollapsed: false,
            isDense: true,
            contentPadding: contentPadding,
            border: border,
            enabledBorder: border,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            /*     focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(width: width,color: AppColor.COLOR_RED1)
            ),*/
            filled: true,fillColor: bgColor,
            prefixIcon: prefixIcon!=null?buildPrefixIcon():null,
            suffixIcon: suffixIcon,
            hintText: hinttext,errorMaxLines: 4,
            hintStyle: TextStyle(fontSize: font,
                // height: 1,
              //  fontFamily: FontFamily.OUTFIT,
                color: hintColor)),
      ),
    );
  }

  InputBorder? get enabledBorder{
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: border);
  }

  InputBorder? get focusedBorder{
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(width: 2,color: focusedBorderColor));
  }

  InputBorder? get errorBorder{
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(width: 2,color: errorColor));
  }


  Widget buildPrefixIcon(){
    final double iconsize=(fontsize+8).sp;
    //final double iconsize=20.h;
    return Container(//color: AppColor.COLOR_RED1,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimen.LOGINFIELD_ICON_HORZ_PADDING.w,),
      child: CustomMonoIcon(icon: prefixIcon!,color: focusedBorderColor,
        size: iconsize,),
    );
  }

  EdgeInsets get contentPadding => EdgeInsets.symmetric(
      horizontal: prefixIcon!=null?0:
      AppDimen.LOGINFIELD_HORZ_PADDING.w,
      // vertical: 0.h,
      vertical: AppDimen.CUSTOMFIELD_VERT_PADDING.h
  );


}

class WordTextField extends CustomField{
  WordTextField({TextEditingController? controller,
    void Function()? onTap,
    void Function(String val)? onChange}):super(
    controller: controller,radius: 5,fontsize: AppDimen.FONT_WORD-1,
    textAlign: TextAlign.center,//textInputAction: TextInputAction.none,
     keyboardType: TextInputType.text,textDirection: TextDirection.rtl,
     onChange: onChange,onTap: onTap,
     // textInputAction: TextInputAction.send,
  );


  @override
  EdgeInsets get contentPadding => EdgeInsets.zero;
}