import 'package:flutter/material.dart';

class WordCategory{
  final Color color;
  final String id;
  const WordCategory({required this.id,required this.color,});

  Map<String,dynamic> toMap(){
    var hex="${color.value.toRadixString(16)}";
    return {"id":id,"color":hex,};
  }

  factory WordCategory.fromMap(Map map){
    var color=Color(int.parse(map["color"], radix: 16));
    return WordCategory(id: map["id"], color: color,);
  }

}

class Word{
  final String? id;
  final String text;
  final String? image;
  final WordCategory? category;
  const Word({this.text="",this.image,this.category,this.id,});

  Map<String,dynamic> toMap({String? id}){
    return {"id":id??this.id,"text":text,"image":image,};
  }

  factory Word.fromMap(Map map,{WordCategory? category,}){
    return Word(id: map["id"],text: map["text"],image: map["image"],
        category: category);
  }

  String get combinedId=>"${category?.id}-${id}";

}