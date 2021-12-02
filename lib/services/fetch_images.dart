import 'package:fun_project/services/global.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchImagesService {
  String apiUrl = 'https://dog.ceo/api/breeds/image/random';
  fetchImages(String value) async {
    if (Global.boxes[BOX_NAME.IMAGE_URL_BOX]!.get(value) == null) {
      try {
        http.Response response = await http.get(
          Uri.parse(apiUrl),
        );

        dynamic jsonDecodedData = jsonDecode(response.body);

        _saveImageUrlLocally(value, jsonDecodedData['message']);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static _saveImageUrlLocally(String id, String url) {
    Global.boxes[BOX_NAME.IMAGE_URL_BOX]!.put(id, url);
  }

  setUpImagesUrl() async {
    Global.boxes[BOX_NAME.IMAGE_URL_BOX]!.put('currentImage', '0');

    for (var i = 0; i < 4; i++) {
      fetchImages(i.toString());
    }
  }
}
