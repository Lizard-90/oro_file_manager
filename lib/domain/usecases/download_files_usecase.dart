import 'package:oro_test/domain/entities/file_entity.dart';
import 'package:oro_test/domain/repositories/repository.dart';

class DownloadFilesUsecase {
  final FileRepository repository;

  DownloadFilesUsecase(this.repository);

  void call(FileEntity file) {
    repository.logDownload(file);
  }
}