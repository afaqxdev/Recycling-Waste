import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Screen/Glass/Glaas_waste.dart';
import 'package:green/Screen/Organic/organic_price.dart';
import 'package:green/Screen/Paper/paper_waste.dart';
import 'package:green/Screen/Reward/Faq_button.dart';
import 'package:green/Screen/Reward/copy_link.dart';
import 'package:green/Screen/Reward/points.dart';
import 'package:green/Screen/metel/Metal_Waste.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../../Feature/Common_Widget/custom-button.dart';
import '../plastic/price_waste.dart';
import 'custom_row.dart';
import 'gift_container.dart';

class reward extends StatefulWidget {
  const reward({super.key});

  @override
  State<reward> createState() => _rewardState();
}

class _rewardState extends State<reward> {
  String website = "www.facebook.com/This.Syco";
  int Point = 0 + pcoin + ocoin + mcoin + pacoin + gcoin;
  String name = '';
  void getdata() async {
    final firestore = FirebaseAuth.instance.currentUser;
    final user = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(firestore!.uid)
        .get();
    print("this is the result $name");
    setState(() {
      name = user.data()!["firstname"];
    });
  }

  void initState() {
    getdata();
    super.initState();
  }

  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.themecolor,
      body: Stack(children: [
        Positioned(
          top: 1.w,
          child: Container(
            height: 180.h,
            width: 400.w,
            color: appcolor.themegreen,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
              child: Column(children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Faq_button(),
                  ],
                ),
                fixheight,
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Row(
                    children: [
                      Text(
                        "Wellcome to",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
                fixheight,
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Row(
                    children: [
                      custom_Text(
                        name: name != null ? name : "Mr/Mrs",
                        color: Colors.black,
                        size: 20.sp,
                        weight: FontWeight.bold,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120.w),
                        child: Row(
                          children: [
                            Image.asset(
                              "image/coin.png",
                              scale: 6,
                            ),
                            custom_Text(
                              name: "$Point",
                              size: 20.sp,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
        Positioned(
          top: 150.h,
          left: 25.w,
          child: InkWell(
            onTap: () {
              Get.to(Get.defaultDialog(
                  title: "",
                  titleStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.7),
                  barrierDismissible: false,
                  content: Container(
                    height: 200.h,
                    width: 280.w,
                    alignment: Alignment.topLeft,
                    child: Column(children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 30.h),
                          child: custom_Text(
                            name: "Pionts",
                            size: 22.sp,
                          )),
                      custom_point(
                        name: "\t\t1000 Points are equal to 10\$ ",
                      ),
                      fixheight,
                      custom_point(
                          name: "\t\tYou need to collect these Points"),
                      fixheight,
                      custom_point(
                          name: "\t\tLevel 1 Account can collect less Point"),
                      Container(
                        width: 100.w,
                        margin: EdgeInsets.only(top: 30.h),
                        child: custom_button(
                            buttonname: "DONE",
                            color: Colors.black.withOpacity(0.5),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      )
                    ]),
                  )));
            },
            child: Container(
              height: 80.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: appcolor.themewhite,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  fixwidth,
                  Icon(
                    Icons.star_border,
                    size: 40.sp,
                  ),
                  fixwidth,
                  custom_Text(
                    name: "Pionts",
                    color: Colors.black,
                    size: 20.sp,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 90.w, top: 30.h),
                    child: Column(
                      children: [
                        custom_Text(
                          name: "1000",
                          size: 20.sp,
                        ),
                        custom_Text(
                          name: "Equal to 10\$",
                          color: appcolor.themegreen,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        gift(
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(bottom: 30.h),
                child: custom_Text(
                  name: "How can Earn Points",
                  size: 22.sp,
                  weight: FontWeight.bold,
                )),
            custom_point(
              name: "\t\tYou can earn 30 Point through invite ",
            ),
            fixheight,
            custom_point(
                name:
                    "\t\tYou can Earn 30 Points on every \n\t\tDelivery of waste"),
            fixheight,
            custom_point(name: "\t\tLevel 1 can earn 3o Point"),
            fixheight,
            custom_point(name: "\t\tLevel 2 can earn more Point"),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(top: 30.h),
              child: custom_button(
                  buttonname: "DONE",
                  color: Colors.black.withOpacity(0.5),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            )
          ]),
          pic_size: 9,
          image: "image/R.png",
          text: "Earn",
          left: 27.w,
        ),
        gift(
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(bottom: 30.h),
                child: custom_Text(
                  name: "Redeem Policy",
                  size: 22.sp,
                )),
            custom_point(name: "\t\tYou can Redeem Minimum 5\$"),
            fixheight,
            custom_point(
                name: "\t\tYou have at least 500 Point for \n\t\t\tRedemption"),
            fixheight,
            custom_point(name: "  You have $Point Point in Your Account"),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(top: 30.h),
              child: custom_button(
                  buttonname: " Redeem",
                  color: Colors.black.withOpacity(0.5),
                  onPressed: () {
                    if (Point > 500) {
                      Navigator.of(context).pop();
                      Dialogs.materialDialog(
                          color: Colors.white,
                          msgStyle: TextStyle(fontSize: 16.sp),
                          msg: 'Congratulations, you won 5\$',
                          title: 'Congratulations',
                          lottieBuilder: LottieBuilder.asset(
                            "image/celeb.json",
                            animate: true,
                          ),
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Claim',
                              iconData: Icons.done,
                              color: Colors.blue,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                      return;
                    } else if (Point < 500) {
                      Get.snackbar("sorry", "You have less then 500 point",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: appcolor.themegreen);
                    }
                    Navigator.of(context).pop();
                  }),
            ),
          ]),
          pic_size: 9,
          image: "image/gift.png",
          text: "Redeem",
          left: 185.w,
        ),
        point(),
        link_copy(website: website)
      ]),
    );
  }
}
