import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_music/provider/audio_provider.dart';
import 'package:stream_music/widget/control.dart';

import '../model/colors.dart';

class UserControlsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(
            icon: Icons.skip_previous,
          ),
          PlayControl(),
          Controls(
            icon: Icons.skip_next,
          ),
        ],
      ),
    );
  }
}
