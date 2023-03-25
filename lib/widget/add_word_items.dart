import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled2/model/word.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/common.dart';
import 'package:untitled2/widget/icons.dart';
import 'package:untitled2/widget/word_items.dart';

class SelectCategoryContainer extends CategoryContainer {
  
  
  final bool chosen;
  const SelectCategoryContainer({Key? key,
    required double width,required double height,this.chosen=false,
    void Function()? onTap,
    required WordCategory category,}) : super(key: key,width: width,height: height,
  onTap: onTap,category: category,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,height: height,
      child: Stack(
        children: [
          super.build(context),
          chosen?Positioned.fill(
              child: Container(color: AppColor.COLOR_BLACK.withOpacity(0.5),
                child: Center(child:IconTick(size: height*0.6,
                  color: AppColor.COLOR_WHITE,)))):Container(),
        ],
      ),);
  }
}


class SelectPictogramContainer extends StatelessWidget {

  final double width,height;
  final bool chosen;
  final void Function()? onTap;
  final String pictogram;
  const SelectPictogramContainer({Key? key,required this.width,required this.height,
  this.chosen=false,this.onTap,required this.pictogram,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(color:AppColor.COLOR_TRANSPARENT,
        width: width,height: height,
        child: Stack(children: [
        Positioned.fill(child: Container(child: CustomImage(image: pictogram,
          imageType: ImageType.TYPE_ASSET,fit: BoxFit.contain,),)),
          chosen?Positioned.fill(
              child: Container(color: AppColor.COLOR_BLACK.withOpacity(0.5),
                  child: Center(child: IconTick(size: height*0.4,color: AppColor.COLOR_WHITE,)))):Container(),
      ],),),
    );
  }
}
