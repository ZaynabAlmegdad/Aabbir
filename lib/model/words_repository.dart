import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WordRepository extends GetxController{
  static WordRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

}