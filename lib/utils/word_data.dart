import 'package:untitled2/model/word.dart';
import 'package:untitled2/utils/asset_path.dart';
import 'package:untitled2/utils/constants.dart';

class WordData{

  static const List<WordCategory> categories= [
    WordCategory(id: "1", color: AppColor.COLOR_ORANGE),
    WordCategory(id: "2", color: AppColor.COLOR_SKINNY),
    WordCategory(id: "3", color: AppColor.COLOR_PINK),
    WordCategory(id: "4", color: AppColor.COLOR_PURPLE),
    WordCategory(id: "5", color: AppColor.COLOR_BLUE),

    WordCategory(id: "6", color: AppColor.COLOR_ORANGE),
    WordCategory(id: "7", color: AppColor.COLOR_SKINNY),
    WordCategory(id: "8", color: AppColor.COLOR_PINK),
    WordCategory(id: "9", color: AppColor.COLOR_PURPLE),
    WordCategory(id: "10", color: AppColor.COLOR_BLUE),

    WordCategory(id: "11", color: AppColor.COLOR_ORANGE),
    WordCategory(id: "12", color: AppColor.COLOR_SKINNY),
    WordCategory(id: "13", color: AppColor.COLOR_PINK),
    WordCategory(id: "14", color: AppColor.COLOR_PURPLE),
    WordCategory(id: "15", color: AppColor.COLOR_BLUE),

    //  WordCategory(id:"16",color: AppColor.COLOR_ORANGE),
  ];

  static const Map<String,List<Word>> words={
    "1":[
      Word(text: "موز",image: AssetPath.SIGN6),
    /*  Word(category: _categories[0],text: "def",image: AssetPath.TREE),
      Word(category: _categories[0],text: "abc",image: AssetPath.TREE),
      Word(category: _categories[0],text: "deaaaf",image: AssetPath.TREE),*/

    ],
    "2":[
      Word(text: "أنا",image: AssetPath.SIGN1),
      Word(text: "افعل",image: AssetPath.SIGN2),
      Word(text: "سوف",image: AssetPath.SIGN3),
      Word(text: "قف",image: AssetPath.SIGN4),
    ],"3":[
      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
     /* Word(category: _categories[2],text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(category: _categories[2],text: "متى؟",image: AssetPath.SIGN5,),
      Word(category: _categories[2],text: "من؟",image: AssetPath.SIGN6,),
      Word(category: _categories[2],text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(category: _categories[2],text: "انتظر",image: AssetPath.SIGN8,),
      Word(category: _categories[2],text: "شكرا",image: AssetPath.SIGN9,),
      Word(category: _categories[2],text: "الى اللقاء",image: AssetPath.SIGN10,),
      Word(category: _categories[2],text: "اعتذر",image: AssetPath.SIGN11,),
      Word(category: _categories[2],text: "ممكن",image: AssetPath.SIGN12,),*/
    ],"4":[
      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(text: "متى؟",image: AssetPath.SIGN5,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),

    ],
    '5':[

      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(text: "متى؟",image: AssetPath.SIGN5,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(text: "متى؟",image: AssetPath.SIGN5,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),

    ],
    '11':[

      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(text: "متى؟",image: AssetPath.SIGN5,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "لماذا",image: AssetPath.SIGN10,),
      Word(text: "أين؟",image: AssetPath.SIGN11,),
      Word(text: "كيف؟",image: AssetPath.SIGN12,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN13,),
      Word(text: "متى؟",image: AssetPath.SIGN14,),

    ],
    '12':[
      Word(text: "كيف؟",image: AssetPath.SIGN12,),

    ],
    '13':[
      Word(text: "لماذا",image: AssetPath.SIGN10,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN13,),
      Word(text: "متى؟",image: AssetPath.SIGN14,),
    ],
    "14":[
      Word(text: "أين؟",image: AssetPath.SIGN13,),
      Word(text: "كيف؟",image: AssetPath.SIGN14,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN15,),
      Word(text: "أين؟",image: AssetPath.SIGN13,),
      Word(text: "كيف؟",image: AssetPath.SIGN14,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN15,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN15,),

      Word(text: "كيف؟",image: AssetPath.SIGN14,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN15,),
      Word(text: "أين؟",image: AssetPath.SIGN13,),
      Word(text: "كيف؟",image: AssetPath.SIGN14,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN15,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN15,),

    ],
    '15':[

      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(text: "متى؟",image: AssetPath.SIGN5,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "لماذا",image: AssetPath.SIGN1,),
      Word(text: "أين؟",image: AssetPath.SIGN2,),
      Word(text: "كيف؟",image: AssetPath.SIGN3,),
      Word(text: "ماذا\ما؟",image: AssetPath.SIGN4,),
      Word(text: "متى؟",image: AssetPath.SIGN5,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "من؟",image: AssetPath.SIGN6,),
      Word(text: "لدي سؤال",image: AssetPath.SIGN7,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),
      Word(text: "انتظر",image: AssetPath.SIGN8,),
      Word(text: "شكرا",image: AssetPath.SIGN9,),

    ]

  };

/*  static List<WordCategory> get filteredCategories{
    return [];
*//*    return _categories.where((cat) {
     // return true;
      return getWords(cat.id).isNotEmpty;
    }).toList();*//*
  }*/

/*  static List<Word> getWords(String cat_id){
    return words[cat_id]??[];
  }*/

}