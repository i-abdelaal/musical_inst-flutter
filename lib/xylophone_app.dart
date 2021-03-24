import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'sound_button.dart';

class XylophoneApp extends StatelessWidget {
  final buttonHeight = 80.0;
  final buttonVerticalPadding = 10.0;
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
    List<Widget> widgetList = colors
        .map((color) => SoundButton(
            buttonColor: color,
            buttonHeight: this.buttonHeight,
            buttonVerticalPadding: this.buttonVerticalPadding,
            playSound: () => playSound(colors.indexOf(color) + 1)))
        .toList();
    return widgetList;
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
