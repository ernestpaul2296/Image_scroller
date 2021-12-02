import 'package:flutter/material.dart';
import 'package:fun_project/services/fetch_images.dart';
import 'package:fun_project/services/global.dart';

class SearchImageTextField extends StatelessWidget {
  //List<int> numbers = [];
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = new FocusNode();
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: TextField(
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          onEditingComplete: () async {
            int previous = int.parse(controller.text) - 1;
            int next = int.parse(controller.text) + 1;
            FetchImagesService().fetchImages(controller.text.toString());
            FetchImagesService().fetchImages(previous.toString());
            FetchImagesService().fetchImages(next.toString());

            int.parse(controller.text);
            FetchImagesService().fetchImages(controller.text.toString());
            Global.boxes[BOX_NAME.IMAGE_URL_BOX]!
                .put('currentImage', controller.text.toString());
            focusNode.unfocus();
          },
          onChanged: (value) {},
          // maxLines: null,
          autofocus: true,
          showCursor: true,
          cursorHeight: 30,
          controller: controller,

          cursorColor: Colors.black,
          scrollPadding: EdgeInsets.symmetric(
            horizontal: 0,
          ),
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            hintText: 'Search image by number',
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            // labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 40),
      height: 60,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
