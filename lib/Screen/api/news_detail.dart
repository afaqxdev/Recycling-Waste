import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';

import '../../Feature/helper/custom_text.dart';

class NewsApiDetails extends StatelessWidget {
  NewsApiDetails(
      {required this.image,
      required this.des,
      required this.title,
      required this.url,
      required this.aut,
      this.sour,
      super.key});

  String image;
  String? sour;
  String des;
  String title;
  String url;
  String aut;
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: appcolor.themegreen,
        ),
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(left: 95.w),
          child: custom_Text(
            name: "News",
            color: appcolor.themegreen,
          ),
        ),
      ),
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          child: Column(children: [
            Container(
              child: Text(
                "News:\t\t\t $title",
                style:
                    GoogleFonts.acme(fontSize: 25, color: appcolor.themegreen),
              ),
            ),
            fixheight,
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Source name:\t\t\t $sour",
                style:
                    GoogleFonts.acme(fontSize: 25, color: appcolor.themegreen),
              ),
            ),
            fixheightui,
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Author:\t\t\t $aut",
                style:
                    GoogleFonts.acme(fontSize: 25, color: appcolor.themegreen),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: appcolor.themewhite,
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " Detail \n\n$des",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ))),
            SizedBox(
              height: 40.0,
            ),
            Container(
                height: 80.h,
                decoration: BoxDecoration(
                    color: appcolor.themewhite,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: SelectableText(
                    url,
                    style: TextStyle(fontSize: 18.sp),
                  )),
                )),
          ]),
        ),
      ),
    );
  }
}
