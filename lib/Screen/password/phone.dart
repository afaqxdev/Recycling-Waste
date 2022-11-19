import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/password/forgot.dart';
import 'package:green/Screen/password/otp.dart';
import 'package:green/Feature/helper/common_var.dart';
import '../../Feature/Common_Widget/Custom_Appbar.dart';
import '../../Feature/Common_Widget/custom-button.dart';
import '../../Feature/Common_Widget/custom_textfield.dart';
import '../../Feature/Common_Widget/text_button.dart';

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "Forgot Password")),
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
