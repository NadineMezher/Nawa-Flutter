
class RemoteConfigHomeModel {
  final String home;

  const RemoteConfigHomeModel({required this.home});

  factory RemoteConfigHomeModel.fromJson(Map<String, dynamic> json) {
    return RemoteConfigHomeModel(
      home: json['home'] ?? '',
    );
  }
}