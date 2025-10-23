import 'package:flutter/material.dart';

import '../../../core/utils/responsive/responsive_view_widget.dart';
import '../view/home_mobile_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(mobile: HomeMobileView());
  }
}
