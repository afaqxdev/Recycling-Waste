import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Screen/password/phone.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/common/text_button.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../Feature/helper/color.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 140.w),
          child: Text(
            "OTTP",
            style: TextStyle(color: appcolor.themegreen, fontSize: 25.sp),
          ),
        ),
        backgroundColor: appcolor.themecolor,
        elevation: 0,
      ),
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Image.asset(
                      "image/forgot.png",
                      scale: 9,
                    )),
                Row(
                  children: [],
                ),
                fixheightui,
                PinCodeTextField(
                  appContext: context,
                  length: 5,
                  textStyle: TextStyle(color: appcolor.themewhite),
                  keyboardType: TextInputType.number,
                  backgroundColor: Colors.transparent,
                  obscureText: true,
                  obscuringCharacter: "*",
                  pinTheme: PinTheme(
                      activeColor: Colors.green,
                      inactiveColor: Colors.green,
                      selectedColor: Colors.red,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12.r),
                      fieldHeight: 40.h,
                      fieldWidth: 40.w),
                  onChanged: (Value) {},
                ),
                fixheightui,
                custom_button(
                    buttonname: "Confirm",
                    color: Colors.green,
                    onPressed: () {}),
                fixheight,
                eleveted_button(
                  name1: "Select",
                  name2: "Phone Number?",
                  onpressed: () {
                    Get.to(phone());
                  },
                  size: 20.sp,
                )
              ],
            )),
      ),
    );
  }
}
