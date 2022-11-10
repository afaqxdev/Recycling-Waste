import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Screen/transaction/model.dart';

class bank_detail extends StatefulWidget {
  bank_detail({required this.image, required this.name, super.key});

  final String name;
  final String image;

  @override
  State<bank_detail> createState() => _bank_detailState();
}

class _bank_detailState extends State<bank_detail> {
  var data = banklist;

  TextEditingController IBN = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController number = TextEditingController();

  Color primaryColor = Colors.grey;

  bool first = false;
  bool second = false;
  bool third = false;
  empty() {
    if (first == true && second == true && third && true) {
      return true;
    }
    return false;
  }

  bool isTextEmpty = false;
  void cleartext() {
    IBN.clear();
    type.clear();
    number.clear();
  }

  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Container(
          margin: EdgeInsets.only(left: 70.w),
          child: Text(
            "Send Money",
            style: TextStyle(color: appcolor.themegreen, fontSize: 20.sp),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: appcolor.themecolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sending to Bank Account",
                  style: TextStyle(fontSize: 20.sp, color: appcolor.themewhite),
                ),
              ),
              fixheightui,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                        color: Colors.green,
                        width: 2.w,
                      ),
                    ),
                    // margin: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 35.r,
                      backgroundImage: AssetImage("${widget.image}"),
                    ),
                  ),
                  Text(
                    " ${widget.name}",
                    style:
                        TextStyle(fontSize: 20.sp, color: appcolor.themewhite),
                  ),
                  Icon(
                    Icons.money,
                    color: Colors.green,
                  )
                ],
              ),
              fixheightui,
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Select Reciever Details",
                  style: TextStyle(fontSize: 20.sp, color: appcolor.themewhite),
                ),
              ),
              fixheightui,
              Row(
                children: [
                  Text(
                    "Enter Account Number or IBAN ",
                    style:
                        TextStyle(fontSize: 17.sp, color: appcolor.themewhite),
                  ),
                  Container(
                    child: Icon(
                      Icons.info,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              fixheight,
              custom_textfield(
                  onchanged: (val) {
                    setState(() {
                      if (val.length > 8) {
                        first = true;
                      } else {
                        first = false;
                      }
                    });
                  },
                  controller: IBN,
                  hintext: "Enter Account Number or IBAN",
                  color: appcolor.themewhite,
                  maincolor: Colors.grey),
              fixheightui,
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter Purpose of Payment ",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: appcolor.themewhite,
                  ),
                ),
              ),
              fixheight,
              custom_textfield(
                  onchanged: (val) {
                    setState(() {
                      if (val.length > 8) {
                        second = true;
                      } else {
                        second = false;
                      }
                    });
                  },
                  controller: type,
                  hintext: "Purpose of payment",
                  color: appcolor.themewhite,
                  maincolor: Colors.grey),
              fixheightui,
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter Mobile Number (Optional) ",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: appcolor.themewhite,
                  ),
                ),
              ),
              fixheight,
              custom_textfield(
                  onchanged: (val) {
                    setState(() {
                      if (val.length > 8) {
                        third = true;
                      } else {
                        third = false;
                      }
                    });
                  },
                  controller: number,
                  hintext: "Enter Reciever's Number",
                  color: appcolor.themewhite,
                  maincolor: Colors.grey),
              fixheightui,
              SizedBox(
                height: 40.h,
                width: 250.w,
                child: TextButton(
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    cleartext();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (empty()) {
                          return Colors.green;
                        }
                        return Colors.grey;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
