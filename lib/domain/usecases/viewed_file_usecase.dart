import 'package:oro_test/domain/entities/file_entity.dart';
import 'package:oro_test/domain/repositories/repository.dart';

class LogViewUsecase {
  final FileRepository repository;

  LogViewUsecase(this.repository);

  void call(FileEntity file) {
    repository.logView(file);
  }
}
