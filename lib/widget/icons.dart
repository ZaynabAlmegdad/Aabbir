import 'package:flutter/material.dart';
import 'package:untitled2/utils/asset_path.dart';

abstract class ResizableIcon{
  double get getSize;
}

class CustomMonoIcon extends ImageIcon implements ResizableIcon{
  CustomMonoIcon({required String icon,double? size,Color? color,}):super(
      AssetImage(icon),size: size,color: color);

  @override
  double get getSize => size!;
}

class IconClose extends CustomMonoIcon{
  IconClose({double? size,Color? color,}):super(
      icon: AssetPath.ICON_CROSS,size: size,color: color);
}

class IconTick extends CustomMonoIcon{
  IconTick({double? size,Color? color,}):super(
      icon: AssetPath.ICON_TICK,size: size,color: color);
}