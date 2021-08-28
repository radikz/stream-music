import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_music/provider/audio_provider.dart';

import '../model/colors.dart';

class PlayControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Consumer<AudioProvider>(
        builder: (_,myAudioModel,child)=>
            GestureDetector(
              onTap: (){
                myAudioModel.audioState=="Playing"? myAudioModel.pauseAudio():myAudioModel.playAudio();
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: blackColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: -2,
                        blurRadius: 5)
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: orangeColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-3, -4),
                                  spreadRadius: -2,
                                  blurRadius: 20)
                            ]),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        decoration:
                        BoxDecoration(color: blackColor, shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                              myAudioModel.audioState=="Playing"?Icons.pause: Icons.play_arrow,
                              size: 50,
                              color: orangeColor,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  const Controls({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white)
                  ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
              BoxDecoration(color: blackColor, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                    icon,
                    size: 30,
                    color: orangeColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}