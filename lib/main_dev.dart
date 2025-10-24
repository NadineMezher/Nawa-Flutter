import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nawa/firebase_options/firebase_options.dart';

import 'app.dart';
import 'core/di/di.dart';
import 'core/global_bloc/remote_config/remote_config_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize services, DI,  etc.
  await AppInitializer().init();
  await sl<RemoteConfigCubit>().fetchRemoteConfigData();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      // assetLoader: RemoteConfigAssetLoader(),
      child: const MyApp(),
    ),
  );
}
