import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green/Feature/Api/example.dart';
import '../../Feature/Common_Widget/custom-button.dart';
import '../../Feature/Common_Widget/custom_textfield.dart';
import '../../Feature/helper/common_var.dart';

class email extends StatefulWidget {
  const email({super.key});

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  TextEditingController fname = TextEditingController();
  TextEditingController femail = TextEditingController();
  TextEditingController fmessage = TextEditingController();
  TextEditingController fto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(children: [
            custom_textfield(
                hintext: "Enter Name",
                controller: fname,
                maincolor: Colors.black),
            fixheight,
            custom_textfield(
                hintext: "your Email",
                controller: femail,
                maincolor: Colors.black),
            fixheight,
            fixheight,
            SizedBox(
              height: 100.h,
              child: custom_textfield(
                  hintext: "Message",
                  controller: fmessage,
                  maincolor: Colors.black),
            ),
            fixheight,
            custom_button(
                buttonname: "Send",
                color: Colors.green,
                onPressed: () async {
                  exampleapi api = exampleapi();
                  dynamic response = await api.sendEmail(
                      fname.text, femail.text, fmessage.text);
                }),
          ]),
        ),
      ),
    );
  }
}
