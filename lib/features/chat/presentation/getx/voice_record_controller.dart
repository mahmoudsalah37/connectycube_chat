import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:get/get.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/dispose_voice_recrod_use_case.dart';
import '../../domin/usecases/pause_voice_recrod_use_case.dart';
import '../../domin/usecases/resume_voice_recrod_use_case.dart';
import '../../domin/usecases/send_voice_record_message_use_case.dart';
import '../../domin/usecases/start__voice_recrod_use_case.dart';
import '../../domin/usecases/stop_voice_recrod_use_case.dart';

class VoiceRecordController extends GetxController {
  final StartVoiceRecordUseCase startRecordUseCase;
  final PauseVoiceRecordUseCase pauseRecordUseCase;
  final ResumeVoiceRecordUseCase resumeRecordUseCase;
  final StopVoiceRecordUseCase stopRecordUseCase;
  final DisposeVoiceRecordUseCase disposeRecordUseCase;
  final SendVoiceRecordMessageUseCase sendVoiceRecordMessageUseCase;
  VoiceRecordController({
    required this.startRecordUseCase,
    required this.pauseRecordUseCase,
    required this.resumeRecordUseCase,
    required this.stopRecordUseCase,
    required this.disposeRecordUseCase,
    required this.sendVoiceRecordMessageUseCase,
  });
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> startRecord({String? path}) async =>
      startRecordUseCase(params: StartRecordParams(path: path));
  Future<void> pauseRecord() async => pauseRecordUseCase(params: NoParams());
  Future<void> resumeRecord() async => resumeRecordUseCase(params: NoParams());
  Future<String?> stopRecord() async => stopRecordUseCase(params: NoParams());
  Future<void> disposeRecord() async =>
      disposeRecordUseCase(params: NoParams());

  Future<CubeMessage> sendVoiceRecord(String? path) {
    return sendVoiceRecordMessageUseCase(
        params: VoiceRecordMessageParams(path: path));
  }

  @override
  void onClose() {
    disposeRecord();
    super.onClose();
  }
}
