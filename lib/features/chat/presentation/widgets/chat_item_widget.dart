import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_chat/core/src/styles.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_first_chat_use_case.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final CubeUser cubeUser;
  final GetFirstCharUseCase getFirstCharUseCase;

  ChatItemWidget({
    required this.onPressed,
    required this.cubeUser,
    required this.getFirstCharUseCase,
  });

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: CustomStyle.containerShadowDecoration,
        child: Row(
          children: [
            ClipOval(
              child: cubeUser.avatar == null
                  ? CircleAvatar(
                      radius: 28,
                      child: Text(
                        getFirstCharUseCase.getFirstChar(
                          string: cubeUser.fullName!.toUpperCase(),
                          limitTo: 1,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: cubeUser.avatar!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (_, url, progress) =>
                          CircularProgressIndicator(),
                    ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cubeUser.fullName!,
                          style: theme.textTheme.headline5!
                              .copyWith(fontSize: 14)),
                      Text(
                        '${cubeUser.lastRequestAt!.hour.toString()}:${cubeUser.lastRequestAt!.minute}',
                        style:
                            theme.textTheme.subtitle1!.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('hey', style: theme.textTheme.subtitle2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
