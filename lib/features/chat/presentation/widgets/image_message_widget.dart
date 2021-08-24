import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/full_image_message_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageMessageWidget extends StatelessWidget {
  final String imageUrl;

  ImageMessageWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return GestureDetector(
      onTap: () => Get.to(FullImageMessagePage(imageUrl: imageUrl)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: res.getHeight(25),
          width: res.getWidth(45),
          fit: BoxFit.cover,
          progressIndicatorBuilder: (_, imageUrl, progress) => Center(
            child: CircularProgressIndicator(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
