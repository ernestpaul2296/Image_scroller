import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_project/models/image_data.dart';
import 'package:fun_project/services/global.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ImageDisplayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ValueListenableBuilder(
          valueListenable: Global.boxes[BOX_NAME.IMAGE_URL_BOX]!.listenable(),
          builder: (context, Box box, wid) {
            String currentImage = box.get('currentImage') ?? '';

            int currentIndex = int.parse(currentImage ?? '') ?? 0;
            List<int> numbers = [];
            for (var i = currentIndex; i < currentIndex + 6; i++) {
              numbers.add(i);
            }
            List<ImageData> imageData = numbers
                .map((e) => ImageData(
                    imageUrl: Global.boxes[BOX_NAME.IMAGE_URL_BOX]!
                            .get(e.toString()) ??
                        '',
                    id: e.toString()))
                .toList();

            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 72,
                  ),
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: imageData.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 16),
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: OptimizedCacheImage(
                                  fit: BoxFit.cover,
                                  imageUrl: imageData[index].imageUrl == ''
                                      ? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vectorstock.com%2Froyalty-free-vector%2Floading-icon-load-load-icon-white-background-vector-27845887&psig=AOvVaw3mPUozJpMW_YfBMH4mY6H6&ust=1638547384254000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjt7e6-xfQCFQAAAAAdAAAAABAE'
                                      : imageData[index].imageUrl,
                                  placeholder: (context, url) =>
                                      CupertinoActivityIndicator(
                                    animating: true,
                                    radius: 30,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Text((int.parse(imageData[index].id)).toString())
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Swipe Left'),
                        Text('Swipe Right'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
