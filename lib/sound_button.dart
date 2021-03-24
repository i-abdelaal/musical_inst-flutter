import 'package:flutter/material.dart';

class SoundButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonVerticalPadding;
  final MaterialColor buttonColor;
  final Function playSound;
  SoundButton(
      {@required this.buttonHeight,
      @required this.buttonVerticalPadding,
      @required this.buttonColor,
      @required this.playSound});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding),
      child: TextButton(
        onPressed: playSound,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        ),
      ),
    );
  }
}
