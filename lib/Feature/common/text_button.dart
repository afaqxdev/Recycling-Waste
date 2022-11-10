import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green/Feature/helper/color.dart';

class eleveted_button extends StatelessWidget {
  eleveted_button(
      {required this.name1,
      required this.name2,
      required this.size,
      required this.onpressed,
      super.key});
  final String name1;
  final String name2;
  final double size;
  final VoidCallback onpressed;
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name1,
          style: TextStyle(color: appcolor.themewhite, fontSize: 18.sp),
        ),
        TextButton(
            onPressed: onpressed,
            child: Text(
              name2,
              style: TextStyle(color: appcolor.themegreen, fontSize: size),
            )),
      ],
    );
  }
}
