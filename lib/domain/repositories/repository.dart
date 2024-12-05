import 'package:oro_test/domain/entities/file_entity.dart';

abstract class FileRepository {
  Future<List<FileEntity>> getFiles();
  void logView(FileEntity file);
  void logDownload(FileEntity file);
  List<FileEntity> getViewedFiles();
  List<FileEntity> getDownloadedFiles();
}