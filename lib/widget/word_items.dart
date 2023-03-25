import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:untitled2/model/word.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/common.dart';
import 'package:untitled2/widget/textfield.dart';

class CategoryContainer extends StatelessWidget {

  final double width,height;
  final WordCategory category;
  final double spacing;
  final void Function()? onTap;
  final bool selected;
  const CategoryContainer({Key? key,required this.width,required this.height,
    this.spacing=0,this.onTap,this.selected=false,
    required this.category,}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius=10.r;
    return Align(alignment: Alignment.bottomCenter,
      child: GestureDetector(onTap: onTap,
        child: Container(
          width: width,height: selected?height*0.72:height,
            decoration: BoxDecoration(
                color: category.color,/*border: selected?Border.all(width: 1,
              color: AppColor.COLOR_BLUE,):const Border(),*/
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              topLeft: Radius.circular(radius))),
          child: Stack(
            children: [
              Align(alignment: Alignment.topCenter,
                child: Container(height: height*0.4,width: width*0.7,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(radius),
                       bottomLeft: Radius.circular(radius)),
                   //color: AppColor.COLOR_BLACK.withAlpha(200),
                 color: AppColor.COLOR_BLACK.withOpacity(0.3),
                 ),
                 // color: category.color.withAlpha(50),
                ),
              ),
           //   Center(child:CustomText(text: category.id,)),
            ],
          ),),
      ),
    );
  }
}

class WordContainer extends StatefulWidget {

  final double width,height;
  final Word word;
  final String? editedText;
  final void Function()? onTap;
  final bool edit;
  final void Function(String val)? onChange;
  const WordContainer({Key? key,this.edit=false,
    this.onChange,this.editedText,
    required this.width,required this.height,this.onTap,
    required this.word,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WordContainerState();
  }

}

class _WordContainerState extends State<WordContainer>{

  late TextEditingController controller=TextEditingController();

  @override
  void initState() {
    controller.text=widget.editedText??widget.word.text;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WordContainer oldWidget) {
    if(!widget.edit || oldWidget.word.combinedId!=widget.word.combinedId) {
      controller.text = widget.editedText ?? widget.word.text;
    }
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    final double radius=3.r;
    return GestureDetector(onTap: widget.onTap,
      child: Container(
        //padding: const EdgeInsets.all(5),
        padding: EdgeInsets.all(widget.height*0.05),
        width: widget.width,height: widget.height,
        decoration: BoxDecoration(
            border: widget.edit?Border.all(color: AppColor.COLOR_ORANGE2,width: 2)
                :const Border(),
            color: widget.word.category!.color,borderRadius: BorderRadius.circular(radius)
        ),
        child: Column(crossAxisAlignment:CrossAxisAlignment.center,
       // widget.edit?CrossAxisAlignment.stretch:CrossAxisAlignment.center,
          children: [
             Flexible(flex: 1,
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: !widget.edit?CustomAutosizeText(isSp: true,
                        text: widget.word.text,fontsize: AppDimen.FONT_WORD,max_lines: 2,
                        textAlign: TextAlign.center,fontweight: FontWeight.w600,
                        line_spacing: 1,minfontsize: 10,):Container(),
                    ),
                    Center(
                      child: AnimatedContainer(
                          width: widget.edit?widget.width:0,
                        //width: widget.width,
                          duration: const Duration(milliseconds: AppInteger.STANDARD_DURATION_MILLI),
                         child: WordTextField(controller: controller,
                           onChange: widget.onChange,onTap: (){
                             controller.selection=TextSelection(baseOffset: 0,
                                 extentOffset: controller.text.length);
                           },),
                          //child: widget.edit?WordTextField(controller: controller,):
     /*             Padding(padding: EdgeInsets.only(bottom: widget.height*0.1,),
                            child: CustomAutosizeText(isSp: true,
                              text: widget.word.text,fontsize: AppDimen.FONT_WORD,max_lines: 2,
                              textAlign: TextAlign.center,fontweight: FontWeight.w600,
                              line_spacing: 1,minfontsize: 10,),
                          ),*/

                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
                flex: 2,
                child: CustomImage(image: widget.word.image,fit: BoxFit.contain,)),
          ],
        ),
      ),
    );
  }
}

class WordScreen extends StatelessWidget {

  final double? height;
  final List<Word> typedWords;
  final ScrollController? scrollController;
  final ItemScrollController? scrollController2;
  const WordScreen({Key? key,this.height,this.scrollController,this.scrollController2,
    this.typedWords=const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius=10.r;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius),
        color: AppColor.COLOR_WHITE,),
      height: height,
  /*      child:  ScrollablePositionedList.separated(
            itemScrollController: scrollController2,
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            scrollDirection: Axis.horizontal,
            itemCount: typedWords.length,reverse: true,
            separatorBuilder:(con,ind){
              return const SizedBox(width: 12,);
            },
            itemBuilder: (con,ind){
              return TypedWordContainer(word: typedWords[ind]);
            }
        ),*/
      child: ListView.separated(
          controller: scrollController,
          padding: EdgeInsets.symmetric(horizontal: 10,
              vertical: 5.h),
          scrollDirection: Axis.horizontal,
          itemCount: typedWords.length,reverse: true,
          separatorBuilder:(con,ind){
            return const SizedBox(width: AppDimen.TYPED_WORDS_BW_SPACING,);
          },
          itemBuilder: (con,ind){
        return TypedWordContainer(word: typedWords[ind]);
      }),
     );
  }
}


class TypedWordContainer extends StatelessWidget {

  final Word word;
  const TypedWordContainer({Key? key,required this.word,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimen.TYPED_WORD_WIDTH,
      child: CustomImage(image: word.image,fit: BoxFit.contain,),);
  }
}
