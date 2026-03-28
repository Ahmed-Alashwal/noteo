import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/core/utils/functions/api_service.dart';
import 'package:note_app/features/note/data/data_sources/local/note_local_data_source.dart';
import 'package:note_app/features/note/data/data_sources/remote/note_remote_data_source.dart';
import 'package:note_app/features/note/data/repository/note_repository_impl.dart';

final GetIt di = GetIt.instance;

Future<void> setupServiceLocator() async {
  di.registerSingleton<ApiService>(ApiService(dio: Dio()));
  di.registerSingleton<NoteRepositoryImpl>(
    NoteRepositoryImpl(
      noteLocalDataSource: NoteLocalDataSourceImpl(),
      noteRemoteDataSource: NoteRemoteDataSourceImpl(
        apiService: di.get<ApiService>(),
      ),
    ),
  );
}
