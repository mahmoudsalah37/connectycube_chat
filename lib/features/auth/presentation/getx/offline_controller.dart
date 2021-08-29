import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/is_online_usecase.dart';
import 'package:get/get.dart';

class OfflineController extends GetxController {
  OfflineController({required this.isOnlineUseCase});
  final IsOnlineUseCase isOnlineUseCase;
  @override
  void onInit() {
    super.onInit();
  }

  void checkInternet() async {
    if (await isOnline) {
      Get.back();
    }
  }

  Future<bool> get isOnline => isOnlineUseCase(params: NoParams());
  @override
  void dispose() {
    super.dispose();
  }
}
