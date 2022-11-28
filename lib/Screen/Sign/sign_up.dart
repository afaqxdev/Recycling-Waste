import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/Common_Widget/Custom_Appbar.dart';
import 'package:green/Feature/firebase/authDetail.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:image_picker/image_picker.dart';
import '../../Feature/Common_Widget/custom-button.dart';
import '../../Feature/Common_Widget/custom_textfield.dart';
import '../../Feature/Common_Widget/text_button.dart';
import '../../Feature/helper/common_var.dart';
import 'sing_in.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late String imageUrl = '';
  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions

    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    var file = File(images!.path);

    if (images != null) {
      //Upload to Firebase
      var snapshot =
          await _firebaseStorage.ref().child('images/imageName').putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    } else {
      print('No Image Path Received');
    }
  }

  late String n, em, p;

  signuP() {
    controller.signup(email: em, password: p, name: n, images: imageUrl);
  }

  bool passwordVisible = false;
  final _field = GlobalKey<FormState>();
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "SignUp")),
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
                    uploadImage();
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
                              child: (imageUrl != null)
                                  ? Image.network(imageUrl)
                                  : Image.network(
                                      'https://i.imgur.com/sUFH1Aq.png'))),
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
