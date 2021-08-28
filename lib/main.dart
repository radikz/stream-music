import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_music/audio_screen.dart';
import 'package:stream_music/provider/audio_provider.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Circular'),
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
        create: (_)=>AudioProvider(),
        child: AudioScreen()),
  ));
}