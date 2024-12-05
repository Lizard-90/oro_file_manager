import 'package:flutter/material.dart';
import 'package:oro_test/domain/entities/file_entity.dart';

class LogPage extends StatelessWidget {
  final List<FileEntity> viewedFiles;
  final List<FileEntity> downloadedFiles;

  const LogPage({
    super.key,
    required this.viewedFiles,
    required this.downloadedFiles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Журнал')),
      body: ListView(
        children: [
          const ListTile(title: Text('Просмотренные файлы')),
          ...viewedFiles.map((file) => ListTile(title: Text(file.name))),
          const Divider(),
          const ListTile(title: Text('Скачанные файлы')),
          ...downloadedFiles.map((file) => ListTile(title: Text(file.name))),
        ],
      ),
    );
  }
}