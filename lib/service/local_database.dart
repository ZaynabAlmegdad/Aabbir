import 'package:get_storage/get_storage.dart';
import 'package:untitled2/model/word.dart';

class LocalDatabase{

  static const _DATA="data",_CATEGORIES="categories",_WORDS="words";

  Map<String,dynamic>? _categories,_words;


  static LocalDatabase? _instance;
  LocalDatabase._();

  final GetStorage _box=GetStorage();

  factory LocalDatabase(){
    return _instance??=LocalDatabase._();
  }

  static Future<LocalDatabase> get instance async{
    if(_instance==null) {
      _instance = LocalDatabase._();
      await _instance!.init();
    }
    return _instance!;
  }

  Future<void> init() async{
    await GetStorage.init();
  }

  bool get isData{
    return (_box.read(_DATA)!=null);
  }

  Future<void> writeinitialData(List<WordCategory> cats,
      Map<String,List<Word>> prods) async{
    _categories={};
    _words={};
    cats.forEach((value) {
      _categories![value.id]=value.toMap();
    });
    prods.forEach((key, value) {
      final Map<String,dynamic> words={};
      for(int i=0;i<value.length;i++){
        final String id="${i+1}";
        final Word word=value[i];
        words[id]=word.toMap(id: id,);
      }
      _words![key]=words;
    });
    var data={_CATEGORIES:_categories,_WORDS:_words};
    await _box.write(_DATA, data);
  }

  void readData(){
    var data=_box.read(_DATA);
    _categories=data[_CATEGORIES];
    _words=data[_WORDS];
    print("cats: ${_categories}");
    print("words: ${_words}");
  }

  List<WordCategory> get filteredCategories{
    return _categories!.values.map<WordCategory>((cat) {
      return WordCategory.fromMap(cat);
    }).where((cat) {
      return _words![cat.id]?.isNotEmpty??false;
    }).toList();
  }

  List<WordCategory> get getCategories{
    return _categories!.values.map<WordCategory>((cat) {
      return WordCategory.fromMap(cat);
    }).toList();
  }

  List<Word> getWords(WordCategory category){
    return _words![category.id]?.values.map<Word>((word) {
      return Word.fromMap(word,category: category);
    }).toList()??[];
  }

  Future<void> saveEditedWords(Map<String,String> edited) async{
    edited.forEach((key, value) {
      final List<String> ids=key.split("-");
      _words![ids[0]][ids[1]]["text"]=value;
    });
    await _writeData();
  }

  Future<void> saveWordToCategory(String word,String pic,WordCategory category) async{
    final String id=(getWords(category).length+1).toString();
    var cat=_words![category.id]??={};
    cat[id]=Word(id: id,text: word,image: pic,).toMap();
    await _writeData();
  }

  Future<void> _writeData() async{
    await _box.write(_DATA, {_CATEGORIES:_categories,_WORDS:_words});
  }

}