import 'dart:async';

import '../../../../core/utils/resposive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RecordDialogWidget extends StatefulWidget {
  final VoidCallback onTapSendVoice, onTapStopVoice, onTapPauseVoice;

  RecordDialogWidget({
    required this.onTapSendVoice,
    required this.onTapStopVoice,
    required this.onTapPauseVoice,
  });

  @override
  _RecordDialogWidgetState createState() => _RecordDialogWidgetState();
}

class _RecordDialogWidgetState extends State<RecordDialogWidget> {
  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final textTheme = Theme.of(context).textTheme;
    return Dialog(
      insetPadding:
          EdgeInsets.symmetric(vertical: res.getHeight(25), horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset('assets/lottie/record_lottie.json', width: 120),
          Text(
            '$minutes:$seconds',
            style: textTheme.headline1!.copyWith(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: widget.onTapStopVoice,
                child: Icon(Icons.close, color: Colors.red, size: 30),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
              ElevatedButton(
                onPressed: widget.onTapPauseVoice,
                child: Icon(Icons.pause, color: Colors.black, size: 30),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
              ElevatedButton(
                onPressed: widget.onTapSendVoice,
                child: Icon(Icons.send, color: Colors.white, size: 30),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  int seconds = 0;
  int minutes = 0;
  Timer? timer;

  void startCountUp() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds != 59) {
        setState(() => seconds++);
      } else {
        seconds = 0;
        minutes++;
        setState(() {});
      }
    });
  }

  void resetTimer() {
    seconds = 0;
    minutes = 0;
    timer?.cancel();
  }

  @override
  void initState() {
    startCountUp();
    super.initState();
  }

  @override
  void dispose() {
    resetTimer();
    super.dispose();
  }
}
