import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/Common_Widget/custom-button.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';

import '../../Feature/Common_Widget/Custom_Appbar.dart';

class price_list extends StatefulWidget {
  const price_list({super.key});

  @override
  State<price_list> createState() => _price_listState();
}

double time = 0;
Appcolor appcolor = Appcolor();

class _price_listState extends State<price_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "Price List")),
      backgroundColor: appcolor.themecolor,
      body: Stack(
        children: [
          Positioned(
            top: 160,
            left: 30.w,
            child: Container(
              width: 300.w,
              height: 380.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: appcolor.themewhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      color: appcolor.themewhite,
                      height: 40.h,
                      child: Card(
                          child: list_price(
                              name: "Weight",
                              name2: "Material",
                              name3: "Price")),
                    ),
                    Container(
                      color: appcolor.themewhite,
                      height: 40.h,
                      child: Card(
                        child: list_price(
                          name: "1 KG    ",
                          name2: "Plastic  ",
                          name3: "30 pkr",
                        ),
                      ),
                    ),
                    Container(
                      color: appcolor.themewhite,
                      height: 40.h,
                      child: Card(
                          child: list_price(
                              name: "1 KG    ",
                              name2: "Glass     ",
                              name3: "40 pkr")),
                    ),
                    Container(
                      color: appcolor.themewhite,
                      height: 40.h,
                      child: Card(
                          child: list_price(
                              name: "1 KG    ",
                              name2: "Metal     ",
                              name3: "45 pkr")),
                    ),
                    Container(
                      color: appcolor.themewhite,
                      height: 40.h,
                      child: Card(
                          child: list_price(
                              name: "1 KG    ",
                              name2: "Organic ",
                              name3: "35 pkr")),
                    ),
                    Container(
                      height: 40.h,
                      color: appcolor.themewhite,
                      child: Card(
                          child: list_price(
                              name: "1 KG    ",
                              name2: "Paper    ",
                              name3: "25 pkr")),
                    ),
                    fixheight,
                    custom_button(
                      buttonname: "OK",
                      color: Colors.green,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class list_price extends StatelessWidget {
  const list_price({
    required this.name,
    required this.name2,
    required this.name3,
    Key? key,
  }) : super(key: key);
  final String name, name2, name3;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
              fontSize: 18.sp, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        fixwidth,
        Container(
          color: Colors.grey,
          height: 60,
          width: 2,
        ),
        fixwidth,
        Text(
          name2,
          style: TextStyle(
              fontSize: 18.sp, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        fixwidth,
        Container(
          color: Colors.grey,
          height: 60,
          width: 2,
        ),
        fixwidth,
        Text(
          name3,
          style: TextStyle(
              fontSize: 18.sp, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
