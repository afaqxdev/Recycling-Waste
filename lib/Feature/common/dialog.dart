import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Feature/helper/custom_text.dart';

Appcolor appcolor = Appcolor();

class CommonDialog {
  static showDialog({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        backgroundColor: appcolor.themewhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hideLoading() {
    Get.back();
  }

  static showLoading() {}

  static showErrorDialog(
      {String title = "Oops Error",
      String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      backgroundColor: appcolor.themewhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            custom_Text(
              name: title,
              size: 19.sp,
            ),
            fixheight,
            custom_Text(
              name: description,
              size: 16.sp,
              color: Colors.black,
            )
          ],
        ),
      ),
    ));
  }
}
