import 'dart:async';
import 'package:hive/hive.dart' show Box;

import './hive.dart';

enum BOX_NAME {
  IMAGE_URL_BOX,
}

class Global {
  static final Map<BOX_NAME, Box> boxes = {
    BOX_NAME.IMAGE_URL_BOX: HiveInstance.imagesUrlBox
  };
}
