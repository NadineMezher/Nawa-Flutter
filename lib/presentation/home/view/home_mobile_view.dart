import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/widgets/app_text.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

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
              AppText(AppStrings.home, textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(Locale('ar'));
                },
                child: Text("English to arabic"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(Locale('en'));
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
