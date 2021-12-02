import 'package:flutter/material.dart';
import 'package:fun_project/pages/home_page/home_page.dart';
import 'package:fun_project/services/fetch_images.dart';
import 'package:fun_project/services/hive.dart';

void main() async {
  await HiveInstance.initialiseHive();

  await FetchImagesService().setUpImagesUrl();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppHomePage()));
}
