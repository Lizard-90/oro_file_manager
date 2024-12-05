import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import '../../core/file_model.dart';

class FileListItem extends StatelessWidget {
  final FileModel file;
  final Function(FileModel) onView;
  final Function(FileModel) onDownload;

  const FileListItem({
    super.key,
    required this.file,
    required this.onView,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}