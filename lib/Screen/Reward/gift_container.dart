import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Reward/custom_row.dart';

import '../../Feature/Common_Widget/custom-button.dart';
import '../../Feature/helper/custom_text.dart';
import '../../Feature/helper/common_var.dart';

class gift extends StatefulWidget {
  gift({
    required this.image,
    required this.text,
    required this.left,
    required this.pic_size,
    this.child,
    super.key,
  });
  final String image;
  final String text;
  final double left;
  final double pic_size;
  Widget? child;

  @override
  State<gift> createState() => _giftState();
}

Appcolor appcolor = Appcolor();

class _giftState extends State<gift> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250.h,
      left: widget.left,
      child: InkWell(
        onTap: () {
          Get.to(Get.defaultDialog(
              title: "",
              titleStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
              backgroundColor: Colors.white.withOpacity(0.8),
              barrierDismissible: false,
              content: Container(
                  height: 250.h,
                  width: 280.w,
                  alignment: Alignment.topLeft,
                  child: widget.child)));
        },
        child: Container(
          width: 145.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: appcolor.themewhite,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Row(
            children: [
              fixwidth,
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    "${widget.image}",
                    scale: widget.pic_size,
                  ),
                  fixheight,
                  custom_Text(
                    name: "${widget.text}",
                    size: 18.sp,
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.orange,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
