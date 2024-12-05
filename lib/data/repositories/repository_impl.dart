import 'package:oro_test/data/datasources/local_data_source.dart';
import 'package:oro_test/domain/entities/file_entity.dart';
import 'package:oro_test/domain/repositories/repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FileLocalDataSource dataSource;
  final List<FileEntity> _viewedFiles = [];
  final List<FileEntity> _downloadedFiles = [];

  FileRepositoryImpl(this.dataSource);

  @override
  Future<List<FileEntity>> getFiles() async {
    return dataSource.fetchFiles();
  }

  @override
  void logView(FileEntity file) {
    _viewedFiles.add(file);
  }

  @override
  void logDownload(FileEntity file) {
    _downloadedFiles.add(file);
  }

  @override
  List<FileEntity> getViewedFiles() => _viewedFiles;

  @override
  List<FileEntity> getDownloadedFiles() => _downloadedFiles;
}