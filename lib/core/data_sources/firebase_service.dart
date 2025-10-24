// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseService {
  late FirebaseRemoteConfig remoteConfig;
  FirebaseService() {
    remoteConfig = FirebaseRemoteConfig.instance;
  }
}
