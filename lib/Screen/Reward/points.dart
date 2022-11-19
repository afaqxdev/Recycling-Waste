import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Glass/Glaas_waste.dart';
import 'package:green/Screen/Organic/organic_price.dart';
import 'package:green/Screen/Paper/paper_waste.dart';
import 'package:green/Screen/metel/Metal_Waste.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Feature/helper/common_var.dart';
import '../plastic/price_waste.dart';

double value = 5;

class point extends StatelessWidget {
  point({
    Key? key,
  }) : super(key: key);
  int Point = pcoin + ocoin + mcoin + pacoin + gcoin;

  Appcolor appcolor = Appcolor();
  late double per = ((Point / 1000) * 100);
  int left = 1000 - pcoin + ocoin + mcoin + gcoin + pacoin;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 370.h,
      left: 25.w,
      child: Container(
        width: 310.w,
        height: 90.h,
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
        child: Row(
          children: [
            fixwidth,
            Image.asset(
              "image/traingle.png",
              scale: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      custom_Text(
                        name: "Gold",
                        size: 20.sp,
                      ),
                      custom_Text(
                        name: "\t(Level 1)",
                        size: 16.sp,
                        color: appcolor.themegreen,
                      ),
                    ],
                  ),
                  fixheight,
                  custom_Text(name: "$left Points to Level 2"),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: LinearPercentIndicator(
                      width: 180.w,
                      animation: true,
                      lineHeight: 14.0,
                      animationDuration: 2000,
                      percent: double.parse("$per") / 100,
                      barRadius: Radius.circular(12.r),
                      center: Text("${per}"),
                      progressColor: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
