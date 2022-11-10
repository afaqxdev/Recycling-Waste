import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Faq_button extends StatelessWidget {
  const Faq_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          width: 60.w,
          height: 25.h,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12.r)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w),
              ),
              CircleAvatar(
                  radius: 8.r,
                  backgroundColor: Colors.black,
                  child: Center(
                      child: Icon(
                    Icons.question_mark_outlined,
                    size: 15,
                  ))),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
              ),
              Text(
                "FAQ",
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
              )
            ],
          ),
        ));
  }
}
