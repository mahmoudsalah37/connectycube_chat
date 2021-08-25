import 'package:connectycube_chat/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class FullImageMessagePage extends StatelessWidget {
  final String imageUrl;

  const FullImageMessagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.close, color: CustomColors.primaryColor),
        ),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
