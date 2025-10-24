part of 'remote_config_cubit.dart';

@immutable
sealed class RemoteConfigState {}

final class RemoteConfigInit extends RemoteConfigState {}

class RemoteConfigLoading extends RemoteConfigState {}

class RemoteConfigSuccess extends RemoteConfigState {}

class RemoteConfigError extends RemoteConfigState {
  final String error;

  RemoteConfigError({required this.error});
}
