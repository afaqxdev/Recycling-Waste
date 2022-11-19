import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';

class CustomappBar extends StatelessWidget {
  CustomappBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  Appcolor appcolor = Appcolor();

  final String name;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: appcolor.themegreen,
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: appcolor.themegreen, fontSize: 20.sp),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
