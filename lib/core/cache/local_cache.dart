import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../data/models/remote_config_reponse_model.dart';

class LocalCache {
  static var remoteData;
  static String baseUrl = '';
  static String currentLocale = "en";
  static String currentCountryCode = "UAE";
  static RemoteConfigResponseModel? remoteConfigData;
  static Map<String, RemoteConfigValue>? remoteConfigMap;
}
