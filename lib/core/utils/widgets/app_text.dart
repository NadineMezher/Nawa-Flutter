import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.softWrap,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      style: style,
    );
  }
}
