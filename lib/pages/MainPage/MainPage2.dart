import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:untitled2/model/word.dart';
import 'package:untitled2/service/local_database.dart';
import 'package:untitled2/service/voice_speaker.dart';
import 'package:untitled2/utils/actions.dart';
import 'package:untitled2/utils/asset_path.dart';
import 'package:untitled2/utils/constants.dart';
import 'package:untitled2/widget/buttons.dart';
import 'package:untitled2/widget/dialog/add_word.dart';
import 'package:untitled2/widget/word_items.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver{

  final LocalDatabase database=LocalDatabase();
  final VoiceSpeaker speaker=VoiceSpeaker();
  late List<WordCategory> categories;
  late double conWidth,wordHeight,catHeight;
  static const int showDiff=2;
  late int fitHorz,fitVert;
  int currentPos=0;//scroll pos
  int? selected;// current category
  bool edit=false;

  final Map<String,String> editedWords={};

  final List<Word> typedWords=[];
  bool type=true;

  final ScrollController scrollController=ScrollController();
  //final ItemScrollController scrollController2=ItemScrollController();
  final ItemScrollController categoryScrollController=ItemScrollController();

  //var focusNode=FocusNode();

  late Orientation orientation;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    orientation=getWindowOrientation();
    loadCategories();
    super.initState();
  }

  void loadCategories(){
    categories=database.filteredCategories;
  }

  Orientation getWindowOrientation(){
    return WidgetsBinding.instance.window.physicalSize.aspectRatio>1?
    Orientation.landscape:Orientation.portrait;
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }


  @override
  void didChangeMetrics() {
    var orient=getWindowOrientation();
    if(orient!=orientation) {
      orientation=orient;
      currentPos = 0;
      scrollToEnd();
    }
    super.didChangeMetrics();
  }

  @override
  void didChangeDependencies() {
    orientation=MediaQuery.of(context).orientation;
    super.didChangeDependencies();
  }

//  final custom1Notifier = ValueNotifier<String>("0");

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context);
    print("size: ${1.sw},${1.sh}");
    print("media size: ${media.size}");
    final double sidePadd=7.w;
    conWidth=media.orientation==Orientation.portrait?
    AppDimen.CON_WIDTH.sw:AppDimen.CON_WIDTH.sh;
    catHeight=media.orientation==Orientation.portrait?
    AppDimen.CAT_HEIGHT.sh:AppDimen.CAT_HEIGHT.sw;
    wordHeight=conWidth;
/*    var focus= FocusScope.of(context);
    return KeyboardActions(
      config: KeyboardActionsConfig(
          keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
          keyboardBarColor: Colors.grey[200],
          nextFocus: false,
          actions: [
            KeyboardActionsItem(
              focusNode: edit?focus:focusNode,
              enabled: false,
              displayDoneButton: false,
             // focusNode: focusNode,
 *//*             toolbarButtons: [
                (node){
                  return Container(
                      height: 30,width: 100,
                      child: LoginField());
                }
              ],*//*
              footerBuilder: (_) => CounterKeyboard(
                notifier: custom1Notifier,
              ),
            ),
          ]
      ),
child:*/

    return GestureDetector(
      onTap: unselectCategory,
      child: Scaffold(//resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.BG_COLOR,
          body: SingleChildScrollView(
            physics: edit?const ScrollPhysics():const NeverScrollableScrollPhysics(),
            child: Container(width: 1.sw,height: 1.sh,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadd,
                    // vertical: sidePadd
                  ),
                  child: buildOrientation(media.orientation,
                    Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible: media.orientation==Orientation.portrait,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: buildActionButtons(media.orientation),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        WordScreen(height: 45.h,typedWords: typedWords,
                          scrollController: scrollController,
                         // scrollController2: scrollController2,
                        ),
                        SizedBox(height: 10.h,),
                        Expanded(child: LayoutBuilder(builder: (con,cons){
                          var size=cons.biggest;
                          final double val=(size.width)/(conWidth);
                          fitHorz=val.toInt();
                          final double horzSpacing=(size.width-(conWidth*fitHorz))/(fitHorz-1);
                          final int catlength=categories.length>=fitHorz?fitHorz:
                          categories.length;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(height: catHeight,
                                child: ScrollablePositionedList.separated(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemScrollController: categoryScrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categories.length,
                                    itemBuilder: (con,ind){
                                      final WordCategory cat=categories[ind];
                                      return CategoryContainer(category: cat,
                                        selected: selected==ind,
                                        width: conWidth,
                                        onTap: (){
                                          selectCategory(ind);
                                        },
                                        height: catHeight,);
                                    },
                                    separatorBuilder: (con,ind){
                                      return SizedBox(width: horzSpacing,);
                                    }),
                              ),
                              SizedBox(height: 12.h,),
                              Expanded(
                                child: LayoutBuilder(
                                    builder: (con,cons) {
                                      var size=cons.biggest;
                                      final double val=(size.height)/(wordHeight);
                                      fitVert=val.toInt();
                                      //final double vert=(size.height-(wordHeight*fitVert));
                                      final double vertSpacing=(size.height-(wordHeight*fitVert))/
                                          (fitVert-1);
                                      int wordIndex=fitVert;
                                      int? relIndex=selected!=null?calRelativeIndex():null;
                                      return Row(
                                        children: List.generate(
                                            catlength,
                                            //WordData.categories.length,
                                                (index) {
                                              final int ind=currentPos+index;
                                              final WordCategory cat=categories[ind];
                                              final List<Word> words=database.getWords(cat);
                                              final int wordLength=words.length>=fitVert?fitVert: words.length;
                                              late int catWordsDiff;
                                              late List<Word> words1;
                                              late int wordslength;
                                              if(selected!=null && index!=relIndex){
                                                words1=getSelectedWords();
                                                //  selWordLength=words.length;
                                                catWordsDiff=wordLength>=showDiff?showDiff:wordLength;
                                                int length=(//words.length>fitVert &&
                                                    wordIndex<words1.length)?
                                                ((words1.length-wordIndex)):0;
                                                if(length>0) {
                                                  length=length+catWordsDiff;
                                                  length = (length >= fitVert) ? fitVert :length;
                                                 /* length = (length >= fitVert) ? fitVert :
                                                  (length+catWordsDiff);*/
                                                }
                                                wordslength=length>wordLength?length:wordLength;
                                              }
                                              else{
                                                wordslength=wordLength;
                                              }
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  right:!(index==(fitHorz-1))?horzSpacing:0,),
                                                child: Container(width: conWidth,
                                                  //categories columns
                                                  child: Column(
                                                      children: List.generate(wordslength,
                                                              (colIndex) {
                                                            late Word word;
                                                            if(selected!=null && index!=relIndex
                                                                && colIndex>=catWordsDiff
                                                                && wordIndex<words1.length){
                                                              word=words1[wordIndex];
                                                              wordIndex++;
                                                            }else{
                                                              word=words[colIndex];
                                                            }
                                                            return Padding(
                                                              padding: EdgeInsets.only(
                                                                bottom: !(colIndex==(fitVert-1))?vertSpacing:0,),
                                                              child: WordContainer(
                                                                editedText: editedWords[word.combinedId],
                                                                onChange: (val){
                                                                  addEditedWord(word,val);
                                                                },
                                                                  edit: edit,
                                                                  onTap: (){
                                                                    typeWord(word);
                                                                  },
                                                                  width: conWidth,
                                                                  height: wordHeight,
                                                                  word: word),
                                                            );
                                                          })),
                                                ),
                                              );
                                            }
                                        ),);
                                    }
                                ),
                              ),
                            ],);
                        },),),
                        SizedBox(height: 7.h,),
                      ],
                    ),
                    Container(//color: AppColor.COLOR_PURPLE,
                      child: Column(mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                              visible: media.orientation==Orientation.landscape,
                              child: buildActionButtons(media.orientation)),
                          buildArrowButtons(media.orientation),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }


  void addEditedWord(Word word,String text,){
    editedWords[word.combinedId]=text;
  }

  void saveWords() async{
    await database.saveEditedWords(editedWords);
    unEdit();
    AppMessage.showMessage("تم حفظ الكلمة");
  }

  List<Word> getSelectedWords(){
    return database.getWords(categories[selected!]);
  }

  void typeWord(Word word){
    if(type) {
      type=false;
      setState(() {
        typedWords.add(word);
      });
      scrollToEnd();
      speaker.speak(word.text);
      type=true;
    }
  }

  void removeWord(){
    if(typedWords.isNotEmpty) {
      setState(() {
        typedWords.removeLast();
      });
    }
  }

  void clearWords(){
    if(typedWords.isNotEmpty) {
      setState(() {
        typedWords.clear();
      });
    }
  }


  void reset(){
    if(typedWords.isEmpty){
      setState(() {
        typedWords.removeLast();
      });
    }
  }

  void unselectCategory(){
    if(selected!=null) {
      setState(() {
        selected = null;
      });
    }
  }


  void selectCategory(int ind){
    if(selected!=ind) {
      setState(() {
        selected = ind;
      });
    }
    else{
      unselectCategory();
    }
  }

  int calRelativeIndex(){
    return selected!-currentPos;
/*    return (index-(fitHorz*
        ((index/fitHorz).floor())));*/
  }

  Widget buildOrientation(Orientation orientation,Widget child1,Widget child2){
    return orientation==Orientation.portrait?Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      Expanded(child: child1),
      child2,
    ],):Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      Expanded(child: child1),
      child2,
    ],);
  }

  Widget buildActionButtons(Orientation orientation){
    const double icon=0.03;
    final double iconsize=orientation==Orientation.portrait?icon.sh:icon.sw;
    var btn1= ActionButton(image: AssetPath.IMAGE_BACKSPACE,
      iconsize: iconsize,
      onTap: (){
      removeWord();
    },);
    var btn2= ActionButton(
      iconsize: iconsize,
      image: AssetPath.IMAGE_RELOAD,onTap: (){
      reset();
    },);
    var btn3= ActionButton(
      iconsize: iconsize,
      image: AssetPath.IMAGE_TRASH,onTap: (){
      clearWords();
    },);
    var btn4= ActionButton(
      iconsize: iconsize,
      image: AssetPath.IMAGE_HOME,onTap: (){
      Navigator.pop(context);
    },);
    var btn5= ActionButton(
      iconsize: iconsize,selected: edit,
      image: AssetPath.ICON_EDIT,onTap: triggerEdit,);
    var btn6= ActionButton(
      iconsize: iconsize,show: edit,
      image: AssetPath.ICON_SAVE,onTap: (){
      saveWords();
    },);
    var btn7=ActionButton(
      iconsize: iconsize,
      image: AssetPath.ICON_PLUS,onTap: (){
        saveWordToCategory();
    },);
    const double btnSpacing=10;
    return orientation==Orientation.portrait?Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        btn6,const SizedBox(width: btnSpacing,),
        btn7,const SizedBox(width: btnSpacing,),
        btn1, const SizedBox(width: btnSpacing,),btn2,
        const SizedBox(width: btnSpacing,),
        btn3, const SizedBox(width: btnSpacing,),btn4,
        const SizedBox(width: btnSpacing,),btn5,
      ],):Column(children: [
      btn6,const SizedBox(height: btnSpacing,),
      btn7,const SizedBox(height: btnSpacing,),
      btn1, const SizedBox(height: btnSpacing,),btn2,
      const SizedBox(height: btnSpacing,),
      btn3, const SizedBox(height: btnSpacing,),btn4,
      const SizedBox(height: btnSpacing,),btn5,
    ],);
  }

  void saveWordToCategory() async{
    AppDialog.showDialog(context, AddWordDialog(onSave: (word,pic,cat) async{
      await database.saveWordToCategory(word,pic,cat);
      setState(() {
        loadCategories();
      });
      AppNavigator.pop(context);
      AppMessage.showMessage("Word added");
    },));
  }

  void unEdit(){
    FocusScope.of(context).unfocus();
    setState(() {
      edit=false;
    });
    editedWords.clear();
  }

  void triggerEdit(){
    if(!edit){
      setState(() {
        edit=true;
      });
    }
    else{
      unEdit();
    }
  }

  Widget buildArrowButtons(Orientation orientation){
    const double icon=0.025;
    final double iconsize=orientation==Orientation.portrait?icon.sh:icon.sw;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10),
      child: Row(mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment:MainAxisAlignment.end,
        children: [
          ArrowButton(iconsize: iconsize,
            image: AssetPath.ICON_ARROW_LEFT,
            left: true,
            onTap: (){
            scrollCategory(-1,);
          },),
          const SizedBox(width: 14),
          ArrowButton(
            iconsize: iconsize,
            image: AssetPath.ICON_ARROW_RIGHT,
            left: false,
            onTap: (){
            scrollCategory(1,);
          },),
        ],),
    );
  }

  void resetCategoryScroll(){
    if(categoryScrollController.isAttached){
      if(categories.isNotEmpty){
        setState(() {
          categoryScrollController.scrollTo(index: currentPos = 0,
              duration: const Duration(
                  milliseconds: AppInteger.SWIPE_DURATION_MILLI));
        });
      }
    }
  }

  void scrollCategory(int pos,){
    if(categoryScrollController.isAttached){
      final int position=currentPos+pos;
      if(position>=0 && position<(categories.length-fitHorz+1)) {
        setState(() {
          categoryScrollController.scrollTo(index: currentPos = position,
              duration: const Duration(
                  milliseconds: AppInteger.SWIPE_DURATION_MILLI));
        });
      }
      print("current pos: ${currentPos}");
    }
  }

  void scrollToEnd(){
/*    if(scrollController2.isAttached){
      scrollController2.jumpTo(index: typedWords.length-1,);
    }*/
    if(scrollController.hasClients){
      final double maxScroll=scrollController.position.maxScrollExtent;
    //  print("scroll extent: ${scrollController.position.atEdge}");
      print("max scroll: ${maxScroll}");
      print("before offset: ${scrollController.offset}");
      if(maxScroll>0) {
      //  scrollController.jumpTo(maxScroll + AppDimen.TYPED_WORD_LENGTH + 12);
      scrollController.animateTo(maxScroll+ AppDimen.TYPED_WORD_WIDTH + 12,
          curve: Curves.linear,
          duration: const Duration(milliseconds: AppInteger.SWIPE_DURATION_MILLI));
      }
      print("after offset: ${scrollController.offset}");
    }
  }
}
