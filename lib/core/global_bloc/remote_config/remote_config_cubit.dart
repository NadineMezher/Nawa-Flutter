import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa/domain/use_cases/remote_config/get_remote_config_use_case.dart';
import '../../../data/models/remote_config_reponse_model.dart';
import '../../cache/local_cache.dart';
import '../../di/di.dart';
part 'remote_config_state.dart';

class RemoteConfigCubit extends Cubit<RemoteConfigState> {
  final getRemoteConfigUseCase = sl.get<GetRemoteConfigUseCase>();

  RemoteConfigCubit() : super(RemoteConfigInit());

  Future<void> fetchRemoteConfigData() async {
    debugPrint("Remote config");
    emit(RemoteConfigLoading());
    try {

      await getRemoteConfigUseCase.call(null).then((result) {
        // LocalCache.remoteConfigMap = result;
        if(result.data != null) {
          final Map<String, dynamic> jsonData = result.data!.map((key, value) {
            return MapEntry(key, jsonDecode(value.asString()));
          });
          final remoteConfigModel = RemoteConfigResponseModel.fromJson(jsonData);
          LocalCache.remoteConfigData = remoteConfigModel;
        }

      }).onError((error, _) {
        emit(RemoteConfigError(error: error.toString()));
      });
      emit(RemoteConfigSuccess());
    } catch (e) {
      emit(RemoteConfigError(error: e.toString()));
    }
  }
}
