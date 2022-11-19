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
import 'package:green/Feature/helper/common_var.dart';
import '../../Feature/Common_Widget/Custom_Appbar.dart';
import '../../Feature/Common_Widget/custom-button.dart';
import '../../Feature/Common_Widget/custom_textfield.dart';
import '../../Feature/Common_Widget/text_button.dart';

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
