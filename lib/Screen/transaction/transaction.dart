import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';

import 'package:green/Screen/transaction/bank_detail.dart';
import 'package:green/Screen/transaction/model.dart';

import '../../Feature/Common_Widget/Custom_Appbar.dart';
import '../../Feature/Common_Widget/custom_textfield.dart';

class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  TextEditingController search = TextEditingController();
  Appcolor appcolor = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "Bank")),
      backgroundColor: appcolor.themecolor,
      body: Column(
        children: [
          fixheight,
          custom_textfield(
            hintext: "Search",
            controller: search,
            maincolor: appcolor.themewhite,
            onchanged: (value) {
              setState(() {});
            },
            passicon: Icon(
              Icons.search,
              color: appcolor.themewhite,
            ),
            color: appcolor.themewhite,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: banklist.length,
                  itemBuilder: (context, index) {
                    var data = banklist[index];
                    String name = "${data.Sub_name}";

                    if (search.text.isEmpty) {
                      return InkWell(
                        onTap: () {
                          Get.to(bank_detail(
                            name: " ${data.Sub_name}",
                            image: "${data.Image}",
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: appcolor.themegreen)),
                            child: ListTile(
                              leading: Image.asset(
                                "${data.Image}",
                                scale: 7,
                              ),
                              title: Text(
                                "${data.Sub_name}",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: appcolor.themewhite,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_outlined,
                                color: appcolor.themewhite,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (name
                        .toLowerCase()
                        .contains(search.text.toLowerCase())) {
                      return InkWell(
                        onTap: () {
                          Get.to(bank_detail(
                            name: " ${data.Sub_name}",
                            image: "${data.Image}",
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: appcolor.themegreen)),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  "${data.Image}",
                                  scale: 7,
                                ),
                                title: Text(
                                  "${data.Sub_name}",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: appcolor.themewhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: appcolor.themewhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("data no found"),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
