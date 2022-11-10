import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/password/forgot.dart';
import 'package:green/Screen/password/otp.dart';
import 'package:green/Screen/Sign/sing_in.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/common/text_button.dart';
import 'package:green/Feature/helper/common_var.dart';

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 40.w),
          child: Text(
            "Forgot Password",
            style: TextStyle(color: appcolor.themegreen, fontSize: 25.sp),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20.h, left: 70.w),
                        child: Image.asset(
                          "image/forgot.png",
                          scale: 9,
                        )),
                  ],
                ),
                fixheightui,
                custom_textfield(
                  color: appcolor.themewhite,
                  hintext: "Phone Number",
                  maincolor: appcolor.themegreen,
                ),
                fixheightui,
                custom_button(
                    buttonname: "Send",
                    color: appcolor.themegreen,
                    onPressed: () {
                      Get.to(otp());
                    }),
                fixheight,
                eleveted_button(
                  name1: "Select",
                  name2: "Email?",
                  onpressed: () {
                    Get.to(forgot());
                  },
                  size: 20.sp,
                )
              ],
            )),
      ),
    );
  }
}
