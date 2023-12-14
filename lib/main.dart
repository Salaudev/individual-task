import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzbeng_dictionary_app/components/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavBar(),
    );
  }
}

