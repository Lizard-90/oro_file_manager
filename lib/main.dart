
import 'package:flutter/material.dart';
import 'package:oro_test/data/datasources/local_data_source.dart';
import 'package:oro_test/domain/entities/file_entity.dart';
import 'package:oro_test/data/repositories/repository_impl.dart';
import 'package:oro_test/presentation/pages/file_list_page.dart.dart';
import 'package:oro_test/presentation/pages/log_page.dart';

void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = FileLocalDataSource();
    final repository = FileRepositoryImpl(dataSource);

    return MaterialApp(
      title: 'File Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: repository.getFiles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                }
                final files = snapshot.data as List<FileEntity>;
                return FileListPage(
                  files: files,
                  onView: repository.logView,
                  onDownload: repository.logDownload,
                );
              },
            ),
        '/logs': (context) => LogPage(
              viewedFiles: repository.getViewedFiles(),
              downloadedFiles: repository.getDownloadedFiles(),
            ),
      },
    );
  }
}