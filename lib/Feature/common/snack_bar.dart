import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class snack_bar extends GetxController {
  void snack(String title, message) {
    Get.snackbar(
      title,
      "",
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20.sp),
      ),
      backgroundColor: Color.fromARGB(96, 82, 82, 82),
      colorText: Colors.white,
    );
  }
}
