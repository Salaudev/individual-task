import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';
import 'package:flutter_tts/flutter_tts.dart';


class WordDetail extends StatefulWidget {
  final WordModel word;

  WordDetail({Key? key, required this.word}) : super(key: key);

  @override
  _WordDetailState createState() => _WordDetailState();
}

class _WordDetailState extends State<WordDetail>  {

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    // Initialize the TTS instance
    flutterTts = FlutterTts();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  share(BuildContext context, WordModel word) {
    final RenderObject? box = context.findRenderObject();

    Share.share("${word.english} - ${word.uzbek}", subject: word.english);
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(92, 185, 98, 1),
        title: Text(
          "Word Detials",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Color.fromRGBO(92, 185, 98, 1),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Text(
                      '${widget.word.english[0].toUpperCase()}${widget.word.english.substring(1)}',
                      style: TextStyle(fontSize: 26, color: Colors.white)),
                  Text(widget.word.type,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(245, 245, 245, 1))),
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(72, 171, 78, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                    new ClipboardData(text: '${widget.word.english}'));
                              },
                              icon: Icon(
                                Icons.copy_outlined,
                                color: Color.fromRGBO(245, 245, 245, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(72, 171, 78, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                                onPressed: () => share(context, widget.word),
                                icon: Icon(
                                  Icons.share_outlined,
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                )),
                          ),
                          SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(72, 171, 78, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                                disabledColor: Color.fromRGBO(230, 230, 230, 1),
                                onPressed: () => speak(widget.word.english),
                                icon: Icon(
                                  Icons.volume_up_outlined,
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                )),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding:
                  EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 15),
                  child: Column(
                    children: [
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Translation',
                                      style: TextStyle(
                                          color: Color.fromRGBO(92, 185, 98, 1),
                                          fontSize: 20)),
                                  Container(
                                    margin:
                                    EdgeInsets.only(top: 15, bottom: 15),
                                    color: Colors.green,
                                    // Green background color
                                    height:
                                    1, // Adjust the height of the green background as needed
                                  ),
                                  Text(
                                    '${widget.word.english[0].toUpperCase()}${widget.word.uzbek.substring(1)}',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Transcript',
                                      style: TextStyle(
                                          color: Color.fromRGBO(92, 185, 98, 1),
                                          fontSize: 18)),
                                  Container(
                                    margin:
                                    EdgeInsets.only(top: 15, bottom: 15),
                                    color: Colors.green,
                                    // Green background color
                                    height:
                                    1, // Adjust the height of the green background as needed
                                  ),
                                  Text(
                                    '${widget.word.transcript}',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Transcript',
                                      style: TextStyle(
                                          color: Color.fromRGBO(92, 185, 98, 1),
                                          fontSize: 14)),
                                  Container(
                                    margin:
                                    EdgeInsets.only(top: 15, bottom: 15),
                                    color: Colors.green,
                                    // Green background color
                                    height:
                                    1, // Adjust the height of the green background as needed
                                  ),
                                  Text(
                                    '${widget.word.countable == 1 ? "countable" : "Uncountable"}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
