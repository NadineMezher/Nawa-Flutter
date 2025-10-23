import 'package:dio/dio.dart';
import 'package:graphql/client.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class Success<T> extends DataState<T> {
  Success(T data) : super(data: data);
}

class Error<T> extends DataState<T> {
  Error(DioException error) : super(error: error);
}
// CollectionResponseModel
abstract class DataStateQL<T> {
  final T? data;
  final GraphQLError? error;

  const DataStateQL({this.data, this.error});
}
// CollectionResponseModel
class SuccessQL<T> extends DataStateQL<T> {
  SuccessQL(T data) : super(data: data);
}

class ErrorQL<T> extends DataStateQL<T> {
  ErrorQL(GraphQLError error) : super(error: error);
}

abstract class DataStateRemoteConfig<T> {
  final T? data;
  final String? error;

  const DataStateRemoteConfig({this.data, this.error});
}

class SuccessRemoteConfig<T> extends DataStateRemoteConfig<T> {
  SuccessRemoteConfig(T data) : super(data: data);
}

class ErrorRemoteConfig<T> extends DataStateRemoteConfig<T> {
  ErrorRemoteConfig(String error) : super(error: error);
}
