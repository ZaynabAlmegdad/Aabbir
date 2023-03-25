import 'package:flutter/material.dart';
import 'package:untitled2/utils/asset_path.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColor{

  static const COLOR_BLACK=Colors.black;

  static const Color THEME_COLOR_PRIMARY1=COLOR_ORANGE2;
  static final Color BG_COLOR=Colors.blue[800]!;

  static const COLOR_WHITE=Colors.white;
  static const COLOR_SKINNY=Color(0xFFFFB7B2);
  static const COLOR_BLUE=Color(0xFFC3DFEA);
  static const COLOR_ORANGE=Color(0xFFEFC291);
  static const COLOR_YELOW=Color(0xFFFEECAE);
  static const COLOR_GREEN=Color(0xFFB6D4AE);
  static const COLOR_PINK=Color(0XFFFF87B2);
  static const COLOR_PURPLE=Color(0XFFBEB4D6);

  static const COLOR_ORANGE2=Colors.orange;
  static const COLOR_RED1=Colors.red;

  static const Color COLOR_GREY1=Color(0xFF464646);
  static const Color COLOR_GREY2=Color(0xFFBEBEBE);
  static const COLOR_GREY3=Color(0xFFFBFDFE);// used for shadow

  static const COLOR_TRANSPARENT=Colors.transparent;

}

class AppInteger{
  static const int SPLASH_DURATION_SEC=2;
  static const int IMAGE_QUALITY=25;
  static const int STANDARD_DURATION_MILLI=400;
  static const int SWIPE_DURATION_MILLI=300;
}

class AppDimen{

  static const double CON_WIDTH=0.17;
  //static const double CON_WIDTH=24;
  static const double CAT_HEIGHT=0.03;

  static const double TYPED_WORD_WIDTH=30;
  static const double TYPED_WORDS_BW_SPACING=12;

  static const double LOGINFIELD_HORZ_PADDING=8;
  static const double LOGINFIELD_VERT_PADDING=8;
  static const double CUSTOMFIELD_VERT_PADDING=14;
  static const double LOGINFIELD_ICON_HORZ_PADDING=13;
  static const double BTN_CLOSE_SIZE=15;
  static const double LOGIN_BUTTON_VERT_PADDING=15;

  static const double LOGIN_FIELD_RADIUS=10;

  static const double FONT_TEXT_FIELD=14;
  static const double FONT_WORD=14;

  static const double ALERT_RADIUS=15;
  static const double LOGIN_BUTTON_RADIUS=10;

}

class AppData{
  static const PICTOGRAMS=[AssetPath.SIGN1, AssetPath.SIGN2, AssetPath.SIGN3,
    AssetPath.SIGN4, AssetPath. SIGN5, AssetPath.SIGN6, AssetPath.SIGN7,
    AssetPath.SIGN8, AssetPath.SIGN9, AssetPath.SIGN10, AssetPath.SIGN11,
    AssetPath.SIGN12, AssetPath.SIGN13, AssetPath.SIGN14, AssetPath.SIGN15,];
}

