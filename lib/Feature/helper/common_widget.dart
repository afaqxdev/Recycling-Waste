import 'package:flutter/material.dart';

class ScreenResponse extends StatelessWidget {
  ScreenResponse({required this.custom_widget, Key? key}) : super(key: key);
  Widget custom_widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: custom_widget,
    );
  }
}
