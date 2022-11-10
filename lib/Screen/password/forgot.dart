import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/firebase/authDetail.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Glass/Glass.dart';
import 'package:green/Screen/Sign/sing_in.dart';
import 'package:green/Screen/password/feedback.dart';
import 'package:green/Screen/password/otp.dart';
import 'package:green/Screen/password/phone.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/common/text_button.dart';
import 'package:green/Feature/helper/common_var.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  Appcolor appcolor = Appcolor();

  late String emailr;
  rest() {
    controller.passwordRest(remail: emailr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 35.w),
          child: Text(
            "Forgot Password ",
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
                  hintext: "Email",
                  color: appcolor.themewhite,
                  maincolor: Colors.green,
                  onchanged: (value) {
                    emailr = value;
                  },
                ),
                fixheightui,
                custom_button(
                    buttonname: "Send",
                    color: Colors.green,
                    onPressed: () {
                      rest();
                    }),
                fixheight,
                eleveted_button(
                  name1: "Select",
                  name2: "Phone Number?",
                  onpressed: () {
                    Get.to(sign_in());
                  },
                  size: 20.sp,
                )
              ],
            )),
      ),
    );
  }
}
