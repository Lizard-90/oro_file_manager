import 'dart:io';

import 'package:oro_test/core/file_model.dart';
import 'package:path_provider/path_provider.dart';

class FileLocalDataSource {
  Future<List<FileModel>> fetchFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    final files = directory.listSync().whereType<File>();
    return files
        .map((file) => FileModel(name: file.uri.pathSegments.last, path: file.path))
        .toList();
  }
}