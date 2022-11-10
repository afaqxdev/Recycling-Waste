import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/firebase/auth.dart';
import 'package:green/Feature/localdb.dart';
import 'package:green/Screen/Main_Page/front.dart';
import 'package:green/Screen/Sign/sing_in.dart';
import 'package:green/Screen/splash_screen/splash_services.dart';
import 'package:green/Screen/splash_screen/start_page.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Feature/helper/common_var.dart';

class Splahscreen extends StatefulWidget {
  const Splahscreen({super.key});

  @override
  State<Splahscreen> createState() => _SplahscreenState();
}

String? User1;
String? User2;

class _SplahscreenState extends State<Splahscreen> {
  localdatabase usersavedata = localdatabase();

  void didChangeDependencies() async {
    SharedPreferences _shper = await SharedPreferences.getInstance();
    _shper.containsKey('userid')
        ? Timer(Duration(seconds: 10), () {
            print("user id 1 $User1");
            print("user id 2 $User2");
            Get.offAll(front());
          })
        : Timer(Duration(seconds: 10), () => Get.offAll(() => sign_in()));
    User1 = await _shper.getString('userid').toString();
    User2 = await usersavedata.getuserData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "image/mou.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: Image.asset(
                    'image/1.png',
                    scale: 1.5,
                  ),
                ),
              ]),
              fixheight,
              // Image.asset("images/fitness.png", scale: 3),
              SizedBox(
                height: 200.h,
              ),
              Container(
                  width: 100.w, child: Lottie.asset('image/loading.json')),
            ],
          ),
        ),
      ),
    );
  }
}
