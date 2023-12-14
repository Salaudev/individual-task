import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzbeng_dictionary_app/components/image_banner.dart';
import 'package:uzbeng_dictionary_app/components/word-container.dart';
import 'package:uzbeng_dictionary_app/controllers/word_list_controller.dart';
import 'package:uzbeng_dictionary_app/views/word_details.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPage createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  final WordListController wordListController = Get.put(WordListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
        backgroundColor: Color.fromRGBO(93, 185, 98, 1),
      ),
      body: Obx(() {
        if (wordListController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                ImageBanner('assets/images/MaxAbout.jpg'),
                Text(
                  'Makset Zinatdinov',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  '22.y.o from Karakalpakstan',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Supervisor at IQOS, Tashkent',
                  style: TextStyle(fontSize: 16, color: Colors.lime),
                ),
                SizedBox(height: 20),
                ImageBanner('assets/images/myprofilePhoto.JPG'),
                Text(
                  'Salauat Erejepov',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  '22.y.o from Karakalpakstan',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Software Engineer at FounderZ, Tokio',
                  style: TextStyle(fontSize: 16, color: Colors.lime),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
