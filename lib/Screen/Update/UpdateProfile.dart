import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/firebase/authDetail.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:shimmer/shimmer.dart';

import '../../Feature/Common_Widget/custom-button.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  Appcolor appcolor = Appcolor();

  String name = "";
  String email = "";
  String image = "";
  void getdata() async {
    final firestore = FirebaseAuth.instance.currentUser;
    final user = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(firestore!.uid)
        .get();
    print("this is the result $name");
    setState(() {
      email = user.data()!["email"];
      name = user.data()!["firstname"];
      image = user.data()!["image"];
    });
  }

  void initState() {
    getdata();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    name = firstname;
    super.setState(fn);
  }

  TextEditingController Nameupdate = TextEditingController();
  String firstname = "";
  updatename() {
    controller.Update("firstname", Nameupdate.text, () {
      setState(() {
        firstname = Nameupdate.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 60.h),
            height: 250.h,
            width: double.infinity,
            color: appcolor.themegreen,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 70.r,
                backgroundImage: (image != null)
                    ? NetworkImage("$image", scale: 2)
                    : NetworkImage(
                        "https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_960_720.png",
                      ),
                // child: (image != null)
                //     ? Image(image: NetworkImage("$image", scale: 20))
                //     : Image(
                //         image: NetworkImage(
                //           "https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_960_720.png",
                //         ),
                //       ),
              ),
              fixheightui,
              custom_Text(
                name: name,
                size: 18.sp,
              )
            ]),
          ),
          fixheightui,
          Container(
            width: 260.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: appcolor.themegreen, width: 1.w),
            ),
            child: Center(
                child: custom_Text(
              name: email,
              size: 18.sp,
            )),
          ),
          fixheightui,
          Container(
            width: 260.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: appcolor.themegreen, width: 1.w),
            ),
            child: Center(
                child: custom_Text(
              name: "*********",
              size: 18.sp,
            )),
          ),
          SizedBox(
            height: 100.h,
          ),
          custom_button(
              buttonname: "Update",
              color: appcolor.themegreen,
              onPressed: () {
                Get.defaultDialog(
                    title: "Edited_Profile",
                    confirm: TextButton(
                      onPressed: () {
                        updatename();
                      },
                      child: custom_Text(
                        name: "update",
                        color: appcolor.themegreen,
                        size: 17.sp,
                      ),
                    ),
                    cancel: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: custom_Text(
                          name: "cancel",
                          size: 17.sp,
                          color: appcolor.themegreen,
                        )),
                    content: Column(children: [
                      Container(
                        margin: EdgeInsets.all(8.0.sp),
                        child: TextField(
                          decoration: InputDecoration(hintText: "name"),
                          controller: Nameupdate,
                        ),
                      ),
                    ]));
              }),
        ]),
      ),
    );
  }
}
