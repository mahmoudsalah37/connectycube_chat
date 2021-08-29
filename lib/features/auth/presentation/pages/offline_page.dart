import '../getx/offline_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflinePage extends GetView<OfflineController> {
  const OfflinePage();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await controller.isOnline,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/gif/no-internet.gif",
              ),
            ),
            TextButton.icon(
              onPressed: controller.checkInternet,
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                'Refresh',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
