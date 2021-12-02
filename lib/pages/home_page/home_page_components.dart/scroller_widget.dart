import 'package:flutter/material.dart';
import 'package:fun_project/services/fetch_images.dart';
import 'package:fun_project/services/global.dart';

class ScrollerWidget extends StatelessWidget {
  List<int> numbers = [];
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 11,
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: (value) => {
            numbers = [],
            for (var i = value - 20; i < value + 20; i++)
              {
                numbers.add(i),
              },
            numbers.forEach((e) {
              FetchImagesService().fetchImages(e.toString());
            }),
            Global.boxes[BOX_NAME.IMAGE_URL_BOX]!
                .put('currentImage', value.toString()),
          },
          itemExtent: 100,
          offAxisFraction: 0,
          squeeze: 0.8,
          magnification: 0.5,
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: 20000,
              builder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  // child: Text(index.toString()),
                );
              }),
        ),
      ),
    );
  }
}
