import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';

class custom_row extends StatelessWidget {
  custom_row({
    required this.valu,
    required this.tota,
    Key? key,
  }) : super(key: key);
  final int valu;
  final int tota;
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        fixheightui,
        Container(
          margin: EdgeInsets.only(left: 30.w, top: 10.h),
          child: Text(
            "$valu kg",
            style: TextStyle(fontSize: 20.sp, color: appcolor.themegreen),
          ),
        ),
        SizedBox(
          width: 130.w,
        ),
        Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              "$tota PKR",
              style: TextStyle(
                fontSize: 20.sp,
                color: appcolor.themegreen,
              ),
            ))
      ],
    );
  }
}
