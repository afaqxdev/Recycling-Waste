import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/Api/Email_Api.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';

import 'package:green/Screen/Menu/model.dart';
import 'package:ndialog/ndialog.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController fname = TextEditingController();
  TextEditingController femail = TextEditingController();
  TextEditingController fmessage = TextEditingController();

  void clearText() {
    fname.clear();
    femail.clear();
    fmessage.clear();
  }

  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
          // image: DecorationImage(
          //     // image: AssetImage("image/back.png"), fit: BoxFit.cover)
          //     ),
          ),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new_outlined,
                  color: appcolor.themegreen),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 90.w),
            child: Text(
              "Home",
              style: TextStyle(color: appcolor.themegreen, fontSize: 25.sp),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
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
                              ProgressDialog progressDialog = ProgressDialog(
                                  context,
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
                  Icons.feedback_outlined,
                  color: appcolor.themegreen,
                ),
              ),
            )
          ],
        ),

        // resizeToAvoidBottomInset: false,
        backgroundColor: appcolor.themecolor,
        body: GridView.builder(
            itemCount: all_data_list.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (context, index) {
              var data = all_data_list[index];
              return InkWell(
                onTap: () {
                  Get.to(all_data_list[index].pagename);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: appcolor.themegreen,
                    elevation: 20,
                    shadowColor: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(children: [
                          Container(
                            width: 150.w,
                            height: 90.h,
                            child: Image.asset(
                              data.Image!,
                            ),
                          ),
                          Container(
                              // margin: EdgeInsets.only(top: 100.h),
                              child: Text(
                            data.Sub_name!,
                            style: TextStyle(fontSize: 20.sp),
                          )),
                        ]),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
