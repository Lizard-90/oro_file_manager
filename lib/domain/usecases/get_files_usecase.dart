import 'package:oro_test/domain/entities/file_entity.dart';
import 'package:oro_test/domain/repositories/repository.dart';


class GetFilesUsecase {
  final FileRepository repository;

  GetFilesUsecase(this.repository);

  Future<List<FileEntity>> call() {
    return repository.getFiles();
  }
}