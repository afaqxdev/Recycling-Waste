import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox OtpCircle(BuildContext context) {
  return SizedBox(
    height: 68.h,
    width: 64.w,
    child: TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.r),
            borderSide: BorderSide(color: Color.fromARGB(255, 7, 211, 41))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.r),
            borderSide: BorderSide(color: Colors.red)),
        hintStyle: TextStyle(
          height: 2.1.h,
          fontSize: 20.sp,
        ),
      ),
      onChanged: ((value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      }),
      style: Theme.of(context).textTheme.headline6,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
    ),
  );
}
