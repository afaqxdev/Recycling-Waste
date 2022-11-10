import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Feature/helper/custom_text.dart';

class custom_point extends StatelessWidget {
  const custom_point({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8.r,
          backgroundColor: Colors.orange,
        ),
        custom_Text(
            name: name, size: 16.sp, color: Color.fromARGB(255, 0, 0, 0)),
      ],
    );
  }
}
