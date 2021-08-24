import 'package:record/record.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

abstract class VoiceRecordDataSource {
  Future<bool> hasPermissionToVoiceRecord();
  Future<void> startVoiceRecord({String? path});
  Future<void> resumeVoiceRecord();
  Future<void> pauseVoiceRecord();
  Future<String?> stopVoiceRecord();
  Future<void> disposeVoiceRecord();
}

class VoiceRecordDataSourceImp implements VoiceRecordDataSource {
  const VoiceRecordDataSourceImp({required this.record});
  final Record record;
  @override
  Future<bool> hasPermissionToVoiceRecord() => record.hasPermission();

  @override
  Future<void> pauseVoiceRecord() => record.pause();

  @override
  Future<void> startVoiceRecord({String? path}) =>
      record.start(path: path, encoder: AudioEncoder.AMR_NB);

  @override
  Future<String?> stopVoiceRecord() => record.stop();

  @override
  Future<void> resumeVoiceRecord() => record.resume();

  @override
  Future<void> disposeVoiceRecord() => record.dispose();
}

class VoiceRecordDataSourceImp2 implements VoiceRecordDataSource {
  const VoiceRecordDataSourceImp2(
      {required this.flutterSoundRecorder, required this.record});
  final FlutterSoundRecorder flutterSoundRecorder;
  final Record record;

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
    return (flutterSoundRecorder..closeAudioSession()).stopRecorder();
  }

  @override
  Future<void> resumeVoiceRecord() => flutterSoundRecorder.resumeRecorder();

  @override
  Future<bool> hasPermissionToVoiceRecord() {
    return record.hasPermission();
  }

  @override
  Future<void> disposeVoiceRecord() {
    return flutterSoundRecorder.closeAudioSession();
  }
}
