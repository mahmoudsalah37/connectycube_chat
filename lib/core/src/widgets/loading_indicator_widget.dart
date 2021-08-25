import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_chat/core/src/styles.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: CustomStyle.containerShadowDecoration,
      padding: EdgeInsets.all(14),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}
