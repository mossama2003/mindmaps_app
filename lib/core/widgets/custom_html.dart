import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CustomHtml extends StatelessWidget {
  const CustomHtml({super.key, this.data, this.textStyle});

  final String? data;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget("$data", textStyle: textStyle);
  }
}
