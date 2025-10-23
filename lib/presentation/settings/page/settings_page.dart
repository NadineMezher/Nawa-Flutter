import 'package:flutter/material.dart';

import '../../../core/utils/responsive/responsive_view_widget.dart';
import '../view/settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(mobile: SettingsView());
  }
}
