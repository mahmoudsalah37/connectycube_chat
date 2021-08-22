import 'package:record/record.dart';

abstract class RecordDataSource {
  Future<bool> hasPermissionToRecord();
  Future<void> startRecord({String? path});
  Future<void> resumeRecord();
  Future<void> pauseRecord();
  Future<String?> stopRecord();
}

class RecordDataSourceImp implements RecordDataSource {
  const RecordDataSourceImp({required this.record});
  final Record record;
  @override
  Future<bool> hasPermissionToRecord() => record.hasPermission();

  @override
  Future<void> pauseRecord() => record.pause();

  @override
  Future<void> startRecord({String? path}) => record.start(path: path);

  @override
  Future<String?> stopRecord() => record.stop();

  @override
  Future<void> resumeRecord() => record.resume();
}
