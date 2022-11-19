import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Screen/Sign/sign_up.dart';
import 'package:green/Screen/Sign/sing_in.dart';
import '../../Feature/Common_Widget/custom-button.dart';

class start_page extends StatefulWidget {
  const start_page({super.key});

  @override
  State<start_page> createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.themecolor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80.h, left: 20.w),
                child: Text(
                  "WELLCOME TO",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 255, 254, 254)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100.h, left: 20.w),
                child: Text(
                  "Recycle System",
                  style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 254, 254)),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 50.h),
                child: Image.asset(
                  "image/bakc_gd.png",
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 100.h,
                  ),
                  child: Image.asset(
                    "image/cleaner.png",
                    scale: 5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150.h,
          ),
          custom_button(
              buttonname: "Get Started",
              color: Colors.green,
              onPressed: () {
                Get.to(signup());
              }),
          fixheightui,
          fixheight,
          custom_button(
              buttonname: "Login",
              color: Colors.green,
              onPressed: () {
                Get.to(sign_in());
              }),
        ],
      ),
    );
  }
}
