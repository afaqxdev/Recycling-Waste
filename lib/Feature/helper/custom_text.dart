import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_Text extends StatelessWidget {
  custom_Text({
    required this.name,
    this.size,
    this.color,
    this.weight,
    Key? key,
  }) : super(key: key);
  final String name;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${name}",
      style: TextStyle(
          fontSize: size, color: color ?? Colors.white, fontWeight: weight),
    );
  }
}
