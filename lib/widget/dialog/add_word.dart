import 'package:flutter/material.dart';
import 'package:untitled2/model/word.dart';
import 'package:untitled2/service/local_database.dart';
import 'package:untitled2/utils/actions.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/add_word_items.dart';
import 'package:untitled2/widget/buttons.dart';
import 'package:untitled2/widget/common.dart';
import 'package:untitled2/widget/textfield.dart';

class AddWordDialog extends StatefulWidget {

  final void Function(String word,String pictogram,WordCategory category) onSave;
  const AddWordDialog({Key? key,required this.onSave,}) : super(key: key);

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {


  late List<WordCategory> categories;
  final TextEditingController word=TextEditingController();

  int? category,pictogram;

  @override
  void initState() {
    categories=LocalDatabase().getCategories;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context);
    final double radius=AppDimen.ALERT_RADIUS.r;
    final double conWidth=media.orientation==Orientation.portrait?
    AppDimen.CON_WIDTH.sw:AppDimen.CON_WIDTH.sh;
    final double catHeight=media.orientation==Orientation.portrait?
    AppDimen.CAT_HEIGHT.sh:AppDimen.CAT_HEIGHT.sw;
    final double wordHeight=conWidth;
    final double spacing=10.h;
    return Container(width: 0.9.sw,
      decoration: BoxDecoration(color: AppColor.COLOR_WHITE,
          borderRadius: BorderRadius.circular(radius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Align(alignment: Alignment.topRight,
          child: ButtonClose(onTap: (){
            AppNavigator.pop(context);
          },),
        ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            buildFieldValue("نوع الكلمة",CustomField(controller: word,
              textDirection: TextDirection.rtl,),),
              SizedBox(height: spacing,),
              buildFieldValue("أختر الفئة",Container(height: catHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (con,ind){
                    final WordCategory cat=categories[ind];
                    return SelectCategoryContainer(category: cat,width: conWidth,height: catHeight,
                      chosen: category==ind,
                      onTap: (){
                        setState(() {
                          category=ind;
                        });
                      },);
                  }, separatorBuilder: (con,ind){
                  return SizedBox(width: 10.w,);
                },),
              ),),
              SizedBox(height: spacing,),
              buildFieldValue("اختر الصورة الرمزية",Container(height: wordHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.PICTOGRAMS.length,
                  itemBuilder: (con,ind){
                    final String pic=AppData.PICTOGRAMS[ind];
                    return SelectPictogramContainer(pictogram: pic,
                      width: conWidth,height: wordHeight,
                      chosen: pictogram==ind,
                      onTap: (){
                        setState(() {
                          pictogram=ind;
                        });
                      },);
                  }, separatorBuilder: (con,ind){
                  return SizedBox(width: 10.w,);
                },),
              ),),

            SizedBox(height: 20.h,),
            CustomButton(text: "حفظ",onTap: (){
              if(category!=null && pictogram!=null) {
                widget.onSave(word.text,AppData.PICTOGRAMS[pictogram!],
                    categories[category!]);
              }
              else{
                AppMessage.showMessage("الرجاء اختيار الفئة & الصورة التوضيحية");
              }
            },),
              SizedBox(height: 10.h,),
          ],),),

    ],),);
  }


  Widget buildFieldValue(String field,Widget value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      buildHeading(field),SizedBox(height: 5.h,),
      value,
    ],);
  }

  Widget buildHeading(String text){
    return CustomText(text: text,fontweight: FontWeight.bold,);
  }
}
