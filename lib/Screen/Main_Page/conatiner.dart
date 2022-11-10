import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Main_Page/model.dart';

class Container_custom extends StatelessWidget {
  Container_custom({
    Key? key,
  }) : super(key: key);
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: ListView.builder(
          itemCount: listview.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = listview[index];
            return InkWell(
              onTap: () {
                Get.to(listview[index].pagename);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.w, top: 40.h),
                height: 90.h,
                width: 130.w,
                decoration: BoxDecoration(
                    color: appcolor.themegreen,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  children: [
                    Image.asset(
                      "${item.Image}",
                      scale: 4,
                    ),
                    Container(
                      child: Text(
                        "${item.Sub_name}",
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16.sp,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
