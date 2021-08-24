import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/dispose_voice_recrod_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/has_permission_to_recrod_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/pause_voice_recrod_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/resume_voice_recrod_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_voice_record_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/start__voice_recrod_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/stop_voice_recrod_use_case.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:get/get.dart';

class VoiceRecordController extends GetxController {
  final StartVoiceRecordUseCase startRecordUseCase;
  final PauseVoiceRecordUseCase pauseRecordUseCase;
  final ResumeVoiceRecordUseCase resumeRecordUseCase;
  final StopVoiceRecordUseCase stopRecordUseCase;
  final DisposeVoiceRecordUseCase disposeRecordUseCase;
  final HasPermissionToRecordUseCase hasPermissionToRecordUseCase;
  final SendVoiceRecordMessageUseCase sendVoiceRecordMessageUseCase;
  VoiceRecordController({
    required this.startRecordUseCase,
    required this.pauseRecordUseCase,
    required this.resumeRecordUseCase,
    required this.stopRecordUseCase,
    required this.disposeRecordUseCase,
    required this.hasPermissionToRecordUseCase,
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
  Future<bool> hasPermissionToRecord() async =>
      hasPermissionToRecordUseCase(params: NoParams());
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
