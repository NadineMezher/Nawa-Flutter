import 'package:flutter/material.dart';

import '../../../core/utils/responsive/responsive_view_widget.dart';
import '../view/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(mobile: SearchView());
  }
}
