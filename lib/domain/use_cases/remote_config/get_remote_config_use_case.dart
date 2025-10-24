
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nawa/core/data_sources/data_state.dart';
import 'package:nawa/core/usecase/use_case.dart';
import 'package:nawa/domain/repo/remote_config/remote_config_repo.dart';

class GetRemoteConfigUseCase extends UseCase<DataStateRemoteConfig<Map<String, RemoteConfigValue>>, void> {
  final RemoteConfigRepo _remoteConfigRepo;
  GetRemoteConfigUseCase(this._remoteConfigRepo);

  @override
  Future<DataStateRemoteConfig<Map<String, RemoteConfigValue>>> call(void p) {
    return _remoteConfigRepo.initRemoteConfig();
  }

}