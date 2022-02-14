import 'dart:async' show Future;
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:kidstarter/entities/quiz.dart';
import 'package:kidstarter/widgets/tile_card2.dart';

Future<List<QuizEntity>> _fetchQuiz() async {
  String jsonString = await rootBundle.loadString('assets/data/quiz.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<QuizEntity>((json) => new QuizEntity.fromJson(json))
      .toList();
}

class Quiz extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  Quiz({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Future<List<QuizEntity>> _quizFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _quizFuture = _fetchQuiz();
    _soundPlayer = new FlutterSoundPlayer();
  }

  void _playAudio(String audioPath) async {
    // Load a local audio file and get it as a buffer
    Uint8List buffer = (await rootBundle.load(audioPath)).buffer.asUint8List();
    await _soundPlayer.startPlayerFromBuffer(buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: _quizFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                          child: TileCard(
                            isActive: _selectedIndex == index,
                            images: snapshot.data[index].foto,
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });

                              _playAudio(snapshot.data[index].audio);
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
