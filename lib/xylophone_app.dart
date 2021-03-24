import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'sound_button.dart';

class XylophoneApp extends StatelessWidget {
  final player = AudioCache(prefix: 'assets/audio/');
  void playSound(int soundNumber) {
    player.play('note$soundNumber.wav');
  }

  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  List<Widget> buttonsList() {
    return colors.map((color) {
      return SoundButton(
          buttonColor: color,
          buttonHeight: 90.0,
          buttonVerticalPadding: 7.0,
          playSound: () => playSound(colors.indexOf(color) + 1));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
          backgroundColor: Colors.black,
        ),
        body: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buttonsList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
