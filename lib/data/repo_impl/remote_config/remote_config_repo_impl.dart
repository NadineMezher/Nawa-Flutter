import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nawa/core/data_sources/data_state.dart';

import '../../../core/di/di.dart';
import '../../../domain/repo/remote_config/remote_config_repo.dart';
import '../../data_sources/remote_config.dart';

class RemoteConfigRepoImpl implements RemoteConfigRepo {
  final RemoteConfigDataSource remoteConfigDataSource = sl
      .get<RemoteConfigDataSource>();

  @override
  Future<DataStateRemoteConfig<Map<String, RemoteConfigValue>>>
  initRemoteConfig() async {
    try {
      final remoteConfig = remoteConfigDataSource.source.remoteConfig;

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 0),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
      return SuccessRemoteConfig(remoteConfig.getAll());
    } on FirebaseException catch (e) {
      return ErrorRemoteConfig(e.message ?? "");
    }
  }
}
