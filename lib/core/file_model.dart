import 'package:oro_test/domain/entities/file_entity.dart';

class FileModel extends FileEntity {
  @override
  final String name;

  @override
  final String path;

  FileModel({required this.name, required this.path});
}