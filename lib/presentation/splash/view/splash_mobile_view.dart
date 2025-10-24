import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_routing/app_routes_name.dart';
import '../../../core/utils/widgets/app_text.dart';

class SplashMobileView extends StatelessWidget {
  const SplashMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("current language: ${context.locale.languageCode}");
    return Scaffold(
      appBar: AppBar(title: AppText("")),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(AppRoutesName.bottomNavigation);
            },
            child: Text("Move to home"),
          ),
        ),
      ),
    );
  }
}
