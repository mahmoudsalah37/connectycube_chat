import 'package:connectycube_sdk/connectycube_sdk.dart';

class ConnectyCubeConfig {
  const ConnectyCubeConfig();
  static const String appID = "5228",
      authKey = "vyw2jwNvgqpBRYJ",
      authSecret = "TCGFT2XfME4EkEE";
  static void initial({Future<CubeSession> Function()? onSessionRestore}) {
    init(
      appID,
      authKey,
      authSecret,
      onSessionRestore: onSessionRestore,
    );
  }
}
