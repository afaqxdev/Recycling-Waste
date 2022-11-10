import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Screen/Glass/Glass.dart';
import 'package:green/Screen/Menu/Menu.dart';
import 'package:green/Screen/Paper/paper.dart';
import 'package:green/Screen/Reward/reward.dart';
import 'package:green/Screen/api/NewsApiScreen.dart';
import 'package:green/Screen/password/feedback.dart';
import 'package:green/Screen/password/forgot.dart';
import 'package:green/Screen/Main_Page/front.dart';
import 'package:green/Screen/Pick/order.dart';
import 'package:green/Screen/password/otp.dart';

import 'package:green/Screen/Price_list/price_list.dart';

import 'package:green/Screen/Sign/sign_up.dart';
import 'package:green/Screen/Sign/sing_in.dart';
import 'package:green/Screen/splash_screen/start_page.dart';
import 'package:green/Screen/splash_screen/splash_screen.dart';
import 'package:green/Screen/splash_screen/splash_services.dart';
import 'package:green/Screen/transaction/bank_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) => GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Splahscreen(),
            // home: metal(),
            // home: price_list(),
            // home: signup(),
            // home: home(),
            // home: email(),
            // home: start_page(),
            // home: front(),
            // home: api(),
            // home: News(),
            // home: plastic_page(),
            // home: map(),
            // home: price_waste(),
            // home: transaction(),
            // home: paper(),
            // home: glass(),
            // home: front(),
            // home: reward(),
            // home: sign_in(),
            // home: forgot()
            // home: otp(),

            debugShowCheckedModeBanner: false,
          )),
    );
  }
}
