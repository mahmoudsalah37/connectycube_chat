import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImageMessagePage extends StatelessWidget {
  final String imageUrl;

  const FullImageMessagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        minScale: .2,
        imageProvider: NetworkImage(imageUrl),
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
