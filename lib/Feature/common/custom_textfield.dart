import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_textfield extends StatelessWidget {
  custom_textfield({
    required this.hintext,
    this.iconname,
    required this.maincolor,
    this.passicon,
    this.showtext,
    this.controller,
    this.onchanged,
    this.color,
    this.vlid,
    Key? key,
  }) : super(key: key);
  final String hintext;
  final Color maincolor;
  final Icon? iconname;
  final Widget? passicon;
  final showtext;
  final Color? color;
  String? Function(String?)? vlid;
  Function(String value)? onchanged;

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 270.h,
      child: TextFormField(
        validator: vlid,
        controller: controller,
        onChanged: onchanged,
        obscureText: showtext ?? false,
        style: TextStyle(color: Colors.green, fontSize: 17.sp),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(color: Color.fromARGB(255, 7, 211, 41))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(color: Colors.grey)),
          hintText: hintext,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: color ?? Colors.black,
          ),
          prefixIcon: iconname,
          suffixIcon: passicon,
        ),
      ),
    );
  }
}
