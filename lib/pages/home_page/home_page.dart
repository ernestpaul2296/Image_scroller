import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/cupertino.dart';
import '../home_page/home_page_components.dart/home_page_components.dart';

class AppHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(alignment: Alignment.topCenter, children: [
            ImageDisplayWidget(),
            ScrollerWidget(),
            SearchImageTextField()
          ]),
        ),
      ),
    );
  }
}
