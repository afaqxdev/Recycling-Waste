import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Main_Page/front.dart';
import 'package:green/Screen/Plastic/plastic.dart';
import 'package:green/Feature/helper/common_var.dart';
import '../../Feature/Common_Widget/Custom_Appbar.dart';
import '../../Feature/Common_Widget/custom-button.dart';

class plastic_waste extends StatefulWidget {
  const plastic_waste({super.key});

  @override
  State<plastic_waste> createState() => _plastic_wasteState();
}

int pcoin = 0;

class _plastic_wasteState extends State<plastic_waste> {
  void _coin() {
    setState(() {
      pcoin += 20;
    });
  }

  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "Plastic")),
      backgroundColor: appcolor.themecolor,
      body: Stack(
        children: [
          Positioned(
              bottom: 100,
              left: 30.w,
              child: Container(
                width: 300.w,
                height: 400.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: appcolor.themewhite,
                ),
                child: Column(
                  children: [
                    fixheight,
                    Text(
                      "Income",
                      style: TextStyle(color: Colors.green, fontSize: 25.sp),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 300.w,
                          height: 180.h,
                          margin: EdgeInsets.only(top: 20.h),
                          child: Image.asset(
                            "image/plastics.png",
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "plastics recycling",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    fixheight,
                    Text(
                      "$pltotal pkr",
                      style: TextStyle(fontSize: 35.sp),
                    ),
                    fixheightui,
                    custom_button(
                        buttonname: "CASH  OUT",
                        color: Colors.green,
                        onPressed: () {
                          _coin();
                          Get.to(Get.defaultDialog(
                              title: "",
                              barrierDismissible: false,
                              titleStyle: TextStyle(
                                  fontSize: 20.sp, color: Colors.white),
                              backgroundColor: Color.fromARGB(255, 145, 207, 31)
                                  .withOpacity(0.8),
                              content: Container(
                                height: 340.h,
                                width: 280.w,
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      "image/truck.png",
                                      scale: 2,
                                    ),
                                  ),
                                  fixheightui,
                                  Center(
                                      child: Text(
                                    "            Truck is on the \nway to recieve your waste",
                                    style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )),
                                  fixheightui,
                                  fixheight,
                                  custom_button(
                                      buttonname: "DONE",
                                      color: Colors.black.withOpacity(0.5),
                                      onPressed: () {
                                        Get.to(front());
                                      })
                                ]),
                              )));
                        })
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
