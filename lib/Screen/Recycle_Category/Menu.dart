import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Recycle_Category/model.dart';

import '../../Feature/Common_Widget/Custom_Appbar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "Menu")),

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
    );
  }
}
