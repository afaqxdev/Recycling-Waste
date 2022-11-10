import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Screen/plastic/plastic.dart';
import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Feature/common/Price_managing.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

double time = 0;

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/map.png"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color.fromARGB(255, 255, 254, 254),
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 70.w),
            child: Text(
              "Order Pick ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 25.sp),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: InkWell(
          onTap: () {},
          child: Container(
            width: 120.w,
            height: 30.h,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [Colors.green, Color.fromARGB(255, 233, 210, 0)])),
            child: Center(
              child: Row(
                children: [
                  fixwidth,
                  Text(
                    "Order",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  fixwidth,
                  Icon(
                    Icons.check_box,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
                top: 160,
                left: 30.w,
                child: Container(
                  width: 300.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 250, 250, 250).withOpacity(0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Container(
                          height: 40.h,
                          child: Card(
                            child: Row(
                              children: [
                                Text(
                                  "Preferred Day",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Mon-Fri",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        fixheight,
                        Container(
                          height: 40.h,
                          child: Card(
                            child: Row(
                              children: [
                                Text(
                                  "Preferred Hour",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "6am-9pm",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          child: Card(
                            child: Row(
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 80.w,
                                ),
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Darra \nadam khel",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
