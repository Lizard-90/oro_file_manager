import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:oro_test/domain/entities/file_entity.dart';

class FileListPage extends StatelessWidget {
  final List<FileEntity> files;
  final Function(FileEntity) onView;
  final Function(FileEntity) onDownload;

  const FileListPage({
    Key? key,
    required this.files,
    required this.onView,
    required this.onDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Файлы')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                return ListTile(
                  title: GestureDetector(
                    onTap: () async {
                      final result = await OpenFilex.open(file.path);
                      if (result.type == ResultType.done) {
                        onView(file);
                      }
                    },
                    child: Text(file.name, style: const TextStyle(color: Colors.blue)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () => onDownload(file),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/logs');
            },
            child: const Text('Перейти к журналу'),
          ),
        ],
      ),
    );
  }
}