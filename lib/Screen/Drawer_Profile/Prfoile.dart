import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Screen/Update/UpdateProfile.dart';

import '../../Feature/helper/color.dart';
import '../../Feature/helper/common_var.dart';
import '../../Feature/helper/custom_text.dart';
import '../Sign/sing_in.dart';

class DrawerProfile extends StatelessWidget {
  DrawerProfile({Key? key, required this.name, required this.IMG})
      : super(key: key);

  Appcolor appcolor = Appcolor();
  final String name;
  Widget IMG;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appcolor.themewhite,
      child: ListView(children: [
        Container(
            height: 150.h,
            margin: EdgeInsets.only(bottom: 50.h),
            child: DrawerHeader(
              decoration: BoxDecoration(color: appcolor.themecolor),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: appcolor.themecolor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: IMG,
                      ),
                    ),
                  ),
                  fixheight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30.w),
                        child: custom_Text(
                          name: name,
                          size: 20.sp,
                        ),
                      ),
                      fixheight,
                      fixwidth,
                      InkWell(
                        onTap: () {
                          Get.to(UpdateProfile());
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.edit_note_outlined,
                            color: appcolor.themegreen,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        fixheightui,
        ListTile(
          iconColor: appcolor.themecolor,
          tileColor: appcolor.themegreen.withOpacity(0.5),
          leading: Icon(Icons.person_add_alt),
          title: custom_Text(
            name: "Account LeveL",
            size: 16.sp,
            color: appcolor.themecolor,
          ),
        ),
        fixheight,
        ListTile(
          iconColor: appcolor.themecolor,
          tileColor: appcolor.themegreen.withOpacity(0.5),
          leading: Icon(Icons.account_balance),
          title: custom_Text(
            name: "My Wallet",
            size: 16.sp,
            color: appcolor.themecolor,
          ),
        ),
        fixheight,
        ListTile(
          iconColor: appcolor.themecolor,
          tileColor: appcolor.themegreen.withOpacity(0.5),
          leading: Icon(Icons.history_edu_outlined),
          title: custom_Text(
            name: "Transcation History",
            size: 16.sp,
            color: appcolor.themecolor,
          ),
        ),
        fixheight,
        ListTile(
          iconColor: appcolor.themecolor,
          tileColor: appcolor.themegreen.withOpacity(0.5),
          leading: Image.asset(
            "image/reward.png",
            scale: 14,
          ),
          title: custom_Text(
            name: "Goal & Reward",
            size: 16.sp,
            color: appcolor.themecolor,
          ),
        ),
        fixheight,
        ListTile(
          iconColor: appcolor.themecolor,
          tileColor: appcolor.themegreen.withOpacity(0.5),
          leading: Icon(Icons.notification_add_outlined),
          title: custom_Text(
            name: "Notification",
            size: 16.sp,
            color: appcolor.themecolor,
          ),
        ),
        fixheight,
        ListTile(
          iconColor: appcolor.themecolor,
          tileColor: appcolor.themegreen.withOpacity(0.5),
          leading: Icon(Icons.help_center_outlined),
          title: custom_Text(
            name: "Help",
            size: 16.sp,
            color: appcolor.themecolor,
          ),
        ),
        fixheight,
        InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Get.offAll(sign_in());
          },
          child: ListTile(
            iconColor: appcolor.themecolor,
            tileColor: appcolor.themegreen.withOpacity(0.5),
            leading: Icon(Icons.logout_outlined),
            title: custom_Text(
              name: "Logout",
              size: 16.sp,
              color: appcolor.themecolor,
            ),
          ),
        ),
      ]),
    );
  }
}
