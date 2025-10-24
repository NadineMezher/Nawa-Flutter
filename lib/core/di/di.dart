import 'package:get_it/get_it.dart';
import 'package:nawa/core/utils/user_settings.dart';
import 'package:nawa/data/repo_impl/remote_config/remote_config_repo_impl.dart';
import 'package:nawa/domain/repo/remote_config/remote_config_repo.dart';
import 'package:nawa/domain/use_cases/remote_config/get_remote_config_use_case.dart';
import '../../data/data_sources/remote_config.dart';
import '../../data/data_sources/remote_dio.dart';
import '../../data/data_sources/remote_graphql.dart';
import '../data_sources/dio.dart';
import '../data_sources/firebase_service.dart';
import '../data_sources/graphql.dart';
import '../global_bloc/remote_config/remote_config_cubit.dart';

final sl = GetIt.instance;

class AppInitializer {
  Future<void> init() async {
    initClientServices();
    initDataSources();
    initFirebaseServices();
    initRepoImpl();
    initUseCases();
    initCubitBloc();
  }
}

void initDataSources() {
  // sl.registerSingleton<LocalDataSource>(LocalDataSource(sl()));
  sl.registerSingleton<RemoteDataSourceQL>(RemoteDataSourceQL(sl()));
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource(sl()));
}

void initClientServices() {
  final dioClient = DioClient();
  dioClient.init();
  sl.registerLazySingleton<DioClient>(() => dioClient);
  sl.registerSingleton<GraphQLService>(GraphQLService());
  sl.registerSingleton<UserSettings>(UserSettings());
}

void initFirebaseServices() {
  sl.registerSingleton<FirebaseService>(FirebaseService());
  sl.registerSingleton<RemoteConfigDataSource>(RemoteConfigDataSource(sl()));
}

void initRepoImpl() {
  sl.registerSingleton<RemoteConfigRepo>(RemoteConfigRepoImpl());
}

void initUseCases() {
  sl.registerSingleton<GetRemoteConfigUseCase>(GetRemoteConfigUseCase(sl()));
}

void initCubitBloc() {
  sl.registerLazySingleton<RemoteConfigCubit>(() => RemoteConfigCubit());
}
