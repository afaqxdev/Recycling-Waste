import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Feature/localdb.dart';
import 'package:green/Screen/Drawer_Profile/Prfoile.dart';
import 'package:green/Screen/Glass/Glass.dart';
import 'package:green/Screen/Main_Page/conatiner.dart';
import 'package:green/Screen/Organic/organic.dart';
import 'package:green/Screen/Paper/paper.dart';
import 'package:green/Screen/metel/matel.dart';
import 'package:ndialog/ndialog.dart';
import '../../Feature/Api/Email_Api.dart';
import '../../Feature/Common_Widget/custom-button.dart';
import '../../Feature/Common_Widget/custom_textfield.dart';
import '../Plastic/plastic.dart';

class front extends StatefulWidget {
  const front({super.key});

  @override
  State<front> createState() => _frontState();
}

localdatabase userdatasave = localdatabase();

class _frontState extends State<front> {
  int money = mtotal + pltotal + ototal + patotal + gtotal;
  String name = "";
  String image = '';
  void getdata() async {
    final firestore = FirebaseAuth.instance.currentUser;
    final user = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(firestore!.uid)
        .get();
    print("this is the result $name");
    setState(() {
      image = user.data()!["image"];
      name = user.data()!["firstname"];
    });
  }

  TextEditingController fname = TextEditingController();
  TextEditingController femail = TextEditingController();
  TextEditingController fmessage = TextEditingController();

  void clearText() {
    fname.clear();
    femail.clear();
    fmessage.clear();
  }

  void initState() {
    getdata();
    super.initState();
  }

  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerProfile(
          IMG: CircleAvatar(
            radius: 40.r,
            backgroundImage: (image != null)
                ? NetworkImage("$image", scale: 2)
                : NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_960_720.png",
                  ),
          ),
          name: name),
      backgroundColor: appcolor.themecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: ("FeedBack"),
                        content: Container(
                          child: Column(children: [
                            fixheight,
                            RatingBar.builder(
                                minRating: 1,
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    rating = rating;
                                  });
                                }),
                            fixheight,
                            SizedBox(
                              height: 50.h,
                              child: custom_textfield(
                                  hintext: "Message",
                                  controller: fmessage,
                                  maincolor: Colors.black),
                            ),
                            fixheight,
                            custom_button(
                                buttonname: "Send",
                                color: Colors.green,
                                onPressed: () async {
                                  ProgressDialog progressDialog =
                                      ProgressDialog(context,
                                          title: Text("Sending Email"),
                                          message: Text("Please wait"));
                                  progressDialog.show();
                                  Api email_send = Api();
                                  dynamic response = await email_send.feedback(
                                    fname.text,
                                    femail.text,
                                    fmessage.text,
                                  );
                                  progressDialog.dismiss();
                                  Get.back();
                                  Get.snackbar("Email Sent", "Successfully",
                                      snackPosition: SnackPosition.BOTTOM);
                                  clearText();
                                }),
                          ]),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Icon(
                      Icons.feedback,
                      color: appcolor.themegreen,
                      size: 30.sp,
                    ),
                  )))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 350.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: appcolor.themegreen,
                        borderRadius: BorderRadius.circular(25.r)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: "About Recycling ",
                        middleText:
                            "By selling Your Waste You Can Earn Money and Also" +
                                " You can Earn Money on Reward If You Achieve The Goals",
                        backgroundColor: Colors.green.withOpacity(0.3),
                        titleStyle: TextStyle(color: Colors.white),
                        middleTextStyle: TextStyle(color: Colors.white),
                        radius: 30.r);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "image/about.png",
                        scale: 11,
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 50.h, right: 13.w),
                    child: Image.asset(
                      "image/Recycle1.png",
                      scale: 7,
                    )),
                Positioned(
                    top: 120.h,
                    left: 35.w,
                    child: Text(
                      "How can you \nEarn Money on \nRecycling ",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: 140.h,
                    left: 35.w,
                    child: Text(
                      "",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 270.h),
                    height: 70.h,
                    width: 270.w,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.h, right: 25.w),
                                child: Text(
                                  "Recycling",
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.w, top: 5.h),
                                child: Text(
                                  "Yure waste Money",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20.w),
                            child: Text(
                              "$money pkr",
                              style: TextStyle(
                                fontSize: 19.sp,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
            Container_custom(),
          ],
        ),
      ),
    );
  }
}
