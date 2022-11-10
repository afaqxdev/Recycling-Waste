import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_button extends StatelessWidget {
  custom_button({
    required this.buttonname,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String buttonname;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: MaterialButton(
        height: 40.h,
        minWidth: double.infinity,
        onPressed: onPressed,
        color: color,
        child: Text(
          buttonname,
          style: TextStyle(
              color: Colors.white,
              fontSize: 19.sp,
              fontWeight: FontWeight.bold),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      ),
    );
  }
}
