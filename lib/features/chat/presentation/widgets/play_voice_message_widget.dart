import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayVoiceMessageWidget extends StatefulWidget {
  final String voiceUrl;

  PlayVoiceMessageWidget({required this.voiceUrl});

  @override
  _PlayVoiceMessageWidgetState createState() => _PlayVoiceMessageWidgetState();
}

class _PlayVoiceMessageWidgetState extends State<PlayVoiceMessageWidget> {
  bool isPlayingVoice = false;

  AudioPlayer audioPlayer = AudioPlayer();

  Duration duration = Duration();

  Duration position = Duration();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            isPlayingVoice == false
                ? playVoiceRecord()
                : await audioPlayer.pause();
            isPlayingVoice = !isPlayingVoice;
            setState(() {});
          },
          child: Icon(
            isPlayingVoice ? Icons.pause : Icons.play_arrow,
            color: Colors.grey,
            size: 40,
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.red,
              trackHeight: 3,
            ),
            child: Slider(
              onChanged: (v) {
                audioPlayer.seek(Duration(seconds: v.toInt()));
                if (position.inSeconds.toInt() == v.toInt()) {
                  isPlayingVoice = false;
                }
                setState(() {});
              },
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              min: 0,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  void playVoiceRecord() async {
    String url = widget.voiceUrl;
    if (isPlayingVoice) {
      //pause song
      final result = await audioPlayer.pause();
      if (result == 1) {
        isPlayingVoice = false;
        setState(() {});
      }
    } else {
      //play song
      final result = await audioPlayer.play(url);
      if (result == 1) {
        isPlayingVoice = true;
        setState(() {});
      }
    }
    audioPlayer.onDurationChanged.listen((duration) {
      this.duration = duration;
      setState(() {});
    });
    audioPlayer.onAudioPositionChanged.listen((position) {
      this.position = position;
      setState(() {});
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
