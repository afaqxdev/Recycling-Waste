import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/common/text_button.dart';
import 'package:green/Feature/firebase/authDetail.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:image_picker/image_picker.dart';
import '../../Feature/helper/common_var.dart';
import 'sing_in.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  File? _image;
  Future upload() async {
    final path = 'file/${_image.toString()}';
    final file = File(_image!.path);
    final ref = FirebaseStorage.instance.ref().child(path).putFile(file);
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final ImageTemp = File(image.path);
    setState(() {
      this._image = ImageTemp;
    });
  }

  Future getImageCam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final ImageTemp = File(image.path);
    setState(() {
      this._image = ImageTemp;
    });
  }

  late String n, em, p;
  signuP() {
    controller.signup(email: em, password: p, name: n);
  }

  bool passwordVisible = false;
  final _field = GlobalKey<FormState>();
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: appcolor.themegreen,
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 80.w),
          child: Text(
            "SIGN UP ",
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
                Image.asset(
                  "image/singup.png",
                  scale: 12,
                ),
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                      ),
                      custom_Text(
                        name: "Profile picture",
                        size: 18.sp,
                        color: appcolor.themewhite,
                      ),
                      SizedBox(
                        width: 150.w,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: appcolor.themewhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: _image != null
                                ? Image.file(_image!.absolute)
                                : Icon(
                                    Icons.camera,
                                  )),
                      ),
                    ],
                  ),
                ),
                fixheightui,
                Form(
                  key: _field,
                  child: Column(
                    children: [
                      custom_textfield(
                        color: appcolor.themewhite,
                        onchanged: (value) {
                          n = value;
                        },
                        vlid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter User name';
                          }
                          return null;
                        },
                        hintext: "Name",
                        maincolor: appcolor.themegreen,
                      ),
                      fixheightui,
                      custom_textfield(
                        onchanged: (value) {
                          em = value;
                        },
                        vlid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        hintext: "Email",
                        maincolor: appcolor.themegreen,
                        color: appcolor.themewhite,
                      ),
                      fixheightui,
                      custom_textfield(
                        onchanged: (value) {
                          p = value;
                        },
                        vlid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        hintext: "Password",
                        maincolor: appcolor.themegreen,
                        color: appcolor.themewhite,
                      ),
                      fixheightui,
                      custom_textfield(
                        onchanged: (value) {
                          p = value;
                        },
                        vlid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        hintext: "Confirm Password",
                        maincolor: appcolor.themegreen,
                        color: appcolor.themewhite,
                      ),
                    ],
                  ),
                ),
                fixheightui,
                custom_button(
                    buttonname: "Sign Up",
                    color: Colors.green,
                    onPressed: () async {
                      if (_field.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        await signuP();
                        upload();
                      }
                    }),
                fixheight,
                eleveted_button(
                  name1: "Already have account",
                  name2: "Sign In",
                  size: 20.sp,
                  onpressed: () {
                    Get.to(sign_in());
                  },
                )
              ],
            )),
      ),
    );
  }
}
