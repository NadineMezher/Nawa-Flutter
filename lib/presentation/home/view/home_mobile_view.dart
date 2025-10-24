import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawa/core/cache/local_cache.dart';
import 'package:nawa/core/global_bloc/remote_config/remote_config_cubit.dart';
import 'package:nawa/core/utils/user_settings.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/widgets/app_text.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText("")),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(LocalCache.remoteConfigData!.remoteConfigHomeModel.home, textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(Locale('ar'));
                  LocalCache.currentLocale = context.locale.languageCode;
                  BlocProvider.of<RemoteConfigCubit>(context).fetchRemoteConfigData();
                  setState(() {});
                },
                child: Text("English to arabic"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(Locale('en'));
                  LocalCache.currentLocale = context.locale.languageCode;
                  BlocProvider.of<RemoteConfigCubit>(context).fetchRemoteConfigData();
                  setState(() {});
                },
                child: Text("Arabic to english"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
