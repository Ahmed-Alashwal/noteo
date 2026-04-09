import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/core/api/dio_consumer.dart';
import 'package:note_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:note_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:note_app/features/note/data/data_sources/local/note_local_data_source.dart';
import 'package:note_app/features/note/data/data_sources/remote/note_remote_data_source.dart';
import 'package:note_app/features/note/data/repository/note_repository_impl.dart';

final GetIt di = GetIt.instance;

Future<void> setupServiceLocator() async {
  // flutter secure storage
  di.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  // Auth
  di.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        apiConsumer: DioConsumer(dio: Dio()),
      ),
    ),
  );
  // Notes
  di.registerSingleton<NoteRepositoryImpl>(
    NoteRepositoryImpl(
      noteLocalDataSource: NoteLocalDataSourceImpl(),
      noteRemoteDataSource: NoteRemoteDataSourceImpl(
        apiConsumer: DioConsumer(dio: Dio()),
      ),
    ),
  );
}
