import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded buildKey({Color? col, int? soundNumber}) {
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: col,
          ),
          onPressed: () async {
            final player = AudioPlayer();
            await player.setSource(
              AssetSource('note$soundNumber.wav'),
            );
            await player.resume();
          },
          child: Text('')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(col: Colors.red, soundNumber: 1),
              buildKey(col: Colors.orange, soundNumber: 2),
              buildKey(col: Colors.yellow, soundNumber: 3),
              buildKey(col: Colors.green, soundNumber: 4),
              buildKey(col: Colors.blue, soundNumber: 5),
              buildKey(col: Colors.indigo, soundNumber: 6),
              buildKey(col: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
