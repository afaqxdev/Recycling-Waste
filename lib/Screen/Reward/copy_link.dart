import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';

import '../../Feature/helper/custom_text.dart';
import '../../Feature/helper/common_var.dart';

class link_copy extends StatelessWidget {
  link_copy({
    Key? key,
    required this.website,
  }) : super(key: key);

  final String website;
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 480.h,
      left: 25.h,
      child: Container(
        width: 310.w,
        height: 170.h,
        decoration: BoxDecoration(
            color: appcolor.themewhite,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 40.w, top: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  custom_Text(
                    name: "Refer  Your Friends",
                    size: 17.sp,
                    weight: FontWeight.bold,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 85.w),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5.r,
                      backgroundColor: Colors.orange,
                    ),
                    fixwidth,
                    custom_Text(
                        name: "You get",
                        size: 16.sp,
                        color: appcolor.themegreen),
                    custom_Text(
                      name: " 100 Point",
                      weight: FontWeight.bold,
                      size: 16.sp,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5.r,
                      backgroundColor: Colors.orange,
                    ),
                    fixwidth,
                    custom_Text(
                        name: "Your's  ",
                        size: 16.sp,
                        color: appcolor.themegreen),
                    custom_Text(
                      name: " Friend get also 100 Point",
                      weight: FontWeight.bold,
                      size: 16.sp,
                    )
                  ],
                ),
              ),
              fixheightui,
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.transparent,
                        border: Border.all(color: appcolor.themecolor)),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 100.w),
                          child: Center(
                            child:
                                custom_Text(name: "www.facebook.com/This.Syco"),
                          ),
                        ),
                        Positioned(
                          left: 154.w,
                          child: MaterialButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: website));
                              Get.snackbar("Save", "",
                                  messageText: custom_Text(
                                    name: "Your Url are Saved",
                                    size: 16.sp,
                                  ),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor:
                                      Colors.orange.withOpacity(0.3));
                            },
                            child: Container(
                              width: 80.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.w),
                                    child: Icon(
                                      Icons.content_copy_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  custom_Text(
                                    name: "Copy",
                                    size: 18.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
