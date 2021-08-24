import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

abstract class VoiceRecordDataSource {
  Future<void> startVoiceRecord({String? path});
  Future<void> resumeVoiceRecord();
  Future<void> pauseVoiceRecord();
  Future<String?> stopVoiceRecord();
  Future<void> disposeVoiceRecord();
}

class VoiceRecordDataSourceImp2 implements VoiceRecordDataSource {
  const VoiceRecordDataSourceImp2({required this.flutterSoundRecorder});
  final FlutterSoundRecorder flutterSoundRecorder;

  @override
  Future<void> pauseVoiceRecord() => flutterSoundRecorder.pauseRecorder();

  @override
  Future<void> startVoiceRecord({String? path}) async {
    await flutterSoundRecorder.openAudioSession();
    flutterSoundRecorder.startRecorder(
        codec: Codec.aacMP4,
        audioSource: AudioSource.microphone,
        toFile: 'to_file.mp4');
  }

  @override
  Future<String?> stopVoiceRecord() {
    return flutterSoundRecorder.stopRecorder();
  }

  @override
  Future<void> resumeVoiceRecord() => flutterSoundRecorder.resumeRecorder();

  @override
  Future<void> disposeVoiceRecord() {
    return flutterSoundRecorder.closeAudioSession();
  }
}
