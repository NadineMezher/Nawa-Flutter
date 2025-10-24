
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nawa/core/data_sources/data_state.dart';

abstract class RemoteConfigRepo {
  Future<DataStateRemoteConfig<Map<String, RemoteConfigValue>>> initRemoteConfig();
}