import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:stream_music/model/colors.dart';
import 'package:stream_music/utils/converter.dart';
import 'package:stream_music/provider/audio_provider.dart';
import 'package:stream_music/widget/user_controls_button.dart';
import 'widget/logo.dart';
import 'widget/custom_appbar.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final _song = Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 35,
        child: Marquee(
          text: 'A Song About You',
          blankSpace: width / 1.5,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: orangeColor),
        ),
      ),
    );

    final _bandName = Text(
      'Razihel',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: orangeColor),
    );

    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomAppBar(),
          Container(
            height: height / 2.5,
            child: Logo(),
          ),
          _song,
          _bandName,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Consumer<AudioProvider>(
                    builder: (_, audio, child) => Text(
                      audio.position == null
                          ? "00:00:00"
                          : Converter().convertMillis(
                              audio.position.inMilliseconds.toDouble()),
                      style: TextStyle(color: orangeColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 5,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
                    child: Consumer<AudioProvider>(
                      builder: (_, audio, child) => Slider(
                        value: audio.position == null
                            ? 0
                            : audio.position.inMilliseconds.toDouble(),
                        activeColor: orangeColor,
                        inactiveColor: orangeColor.withOpacity(0.3),
                        onChanged: (value) {
                          audio.seekAudio(Duration(milliseconds: value.toInt()));
                        },
                        min: 0,
                        max: audio.totalDuration == null
                            ? 20
                            : audio.totalDuration.inMilliseconds.toDouble(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Consumer<AudioProvider>(
                    builder: (_, audio, child) => Text(
                      audio.totalDuration == null
                          ? "00:00:00"
                          : Converter().convertMillis(
                              audio.totalDuration.inMilliseconds.toDouble()),
                      style: TextStyle(color: orangeColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UserControlsButton(),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
