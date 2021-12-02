import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInstance {
  static late Box _imagesUrlBox;
  static initialiseHive() async {
    await Hive.initFlutter();
    _imagesUrlBox = await Hive.openBox('images_url_box');
  }

  static Box get imagesUrlBox {
    return _imagesUrlBox;
  }
}
