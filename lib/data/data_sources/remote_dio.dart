import '../../core/data_sources/dio.dart';
import '../../core/data_sources/remote.dart';

class RemoteDataSource extends IRemoteDataSource<DioClient> {
  RemoteDataSource(super.source);
}
