import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RecordDialogWidget extends StatelessWidget {
  final VoidCallback onTapSendVoice;
  final VoidCallback onTapCancel;
  final VoidCallback onTapPause;

  RecordDialogWidget({
    required this.onTapSendVoice,
    required this.onTapCancel,
    required this.onTapPause,
  });

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
            '00:00',
            style: textTheme.headline1!.copyWith(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: onTapCancel,
                child: Icon(Icons.close, color: Colors.red, size: 30),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
              ElevatedButton(
                onPressed: onTapPause,
                child: Icon(Icons.pause, color: Colors.black, size: 30),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
              ),
              ElevatedButton(
                onPressed: onTapSendVoice,
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
}