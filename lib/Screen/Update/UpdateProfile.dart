import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/firebase/Getdetail.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Feature/helper/custom_text.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  Appcolor appcolor = Appcolor();
  getdatafire let = getdatafire();

  String name = "";
  String email = '';
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

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 30.h),
            height: 250.h,
            width: double.infinity,
            color: appcolor.themegreen,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 50.r,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.r),
                    child: image != null
                        ? Image.network(image, fit: BoxFit.cover)
                        : Image.network(
                            "https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_960_720.png")),
              ),
              fixheightui,
              custom_Text(
                name: name,
                size: 20.sp,
              ),
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
              name: email != null ? email : "gmai@.com",
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
                TextEditingController nameuodate = TextEditingController();
                Get.defaultDialog(
                    title: "Edited_trainers",
                    content: Column(children: [
                      Container(
                        margin: EdgeInsets.all(8.0.sp),
                        child: TextField(
                          decoration: InputDecoration(hintText: "name"),
                          controller: nameuodate,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: custom_button(
                          buttonname: "change",
                          color: appcolor.themegreen,
                          onPressed: () async {
                            final firestore = FirebaseAuth.instance.currentUser;
                            final user = await FirebaseFirestore.instance
                                .collection("App_User_credentials")
                                .doc(firestore!.uid)
                                .update({"firstname": nameuodate.text});
                            Get.back();
                          },
                        ),
                      )
                    ]));
              }),
        ]),
      ),
    );
  }
}
