import 'package:flutter_tts/flutter_tts.dart';

class VoiceSpeaker{

  static const LANG_EN="en",LANG_AR="ar";

  static VoiceSpeaker? _instance;

  VoiceSpeaker._();

  final FlutterTts _flutterTts = FlutterTts();


  factory VoiceSpeaker(){
    return _instance??=VoiceSpeaker._();
  }

  Future<void> init() async{
   // bool supported=await _flutterTts.isLanguageAvailable(LANG_AR);
    await _flutterTts.setLanguage(LANG_AR);
   // await _flutterTts.setPitch(0.1);
  }

  void speak(String word){
    _flutterTts.speak(word);
  }
}