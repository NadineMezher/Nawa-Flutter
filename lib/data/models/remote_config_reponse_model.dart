import 'package:nawa/core/cache/local_cache.dart';
import 'package:nawa/core/utils/enums/remote_config/remote_config_enums.dart';
import 'package:nawa/core/utils/user_settings.dart';
import 'package:nawa/data/models/remote_config_home_model.dart';

class RemoteConfigResponseModel {
  final RemoteConfigHomeModel remoteConfigHomeModel;

  RemoteConfigResponseModel({required this.remoteConfigHomeModel});

  factory RemoteConfigResponseModel.fromJson(Map<String, dynamic> json) {
    return RemoteConfigResponseModel(
      remoteConfigHomeModel: RemoteConfigHomeModel.fromJson(
        json['${LocalCache.currentLocale}_${LocalCache.currentCountryCode}_${RemoteConfigEnums.home_content.name}'],
      ),
    );
  }
}
