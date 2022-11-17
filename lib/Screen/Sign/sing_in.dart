import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/firebase/authDetail.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:green/Screen/Main_Page/front.dart';
import 'package:green/Screen/Main_Page/model.dart';
import 'package:green/Screen/Recycle_Category/Menu.dart';
import 'package:green/Screen/password/forgot.dart';
import 'package:green/Screen/Sign/sign_up.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/common/text_button.dart';
import 'package:green/Feature/helper/common_var.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  late String name3;
  String meail = "email...";
  void getdata() async {
    var user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(user!.uid)
        .get();
    setState(() {
      name3 = vari.data()!['firstname'];
    });
  }

  late String email, password;
  var db = FirebaseFirestore.instance;
  In() {
    controller.SignIn(
      email: email,
      password: password,
    );
  }

  Appcolor appcolor = Appcolor();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 130.w),
          child: Text(
            "SIGN IN ",
            style: TextStyle(color: appcolor.themegreen, fontSize: 25.sp),
          ),
        ),
        backgroundColor: appcolor.themecolor,
        elevation: 0,
      ),
      // resizeToAvoidBottomInset: false,
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20.h, left: 60.w),
                        child: Image.asset(
                          "image/3.png",
                          scale: 2.0,
                        )),
                  ],
                ),
                fixheightui,
                custom_textfield(
                  hintext: "Email",
                  onchanged: (value) {
                    email = value;
                  },
                  maincolor: appcolor.themegreen,
                  color: appcolor.themewhite,
                ),
                fixheightui,
                custom_textfield(
                  hintext: "Password",
                  onchanged: (value) {
                    password = value;
                  },
                  maincolor: appcolor.themegreen,
                  color: appcolor.themewhite,
                  showtext: !_passwordVisible,
                  passicon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: appcolor.themegreen,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 160.w),
                    child: eleveted_button(
                      name1: "Forgot",
                      name2: "PASSWORD ?",
                      onpressed: () {
                        Get.to(forgot());
                      },
                      size: 16.sp,
                    )),
                custom_button(
                    buttonname: "Sign In",
                    color: Colors.green,
                    onPressed: () {
                      In();
                    }),
                fixheight,
                eleveted_button(
                  name1: "Don't have account",
                  name2: "Sign Up",
                  size: 20.sp,
                  onpressed: () {
                    Get.to(signup());
                  },
                )
              ],
            )),
      ),
    );
  }
}
