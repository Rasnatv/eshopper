import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/style/app_text_style.dart';
import '../views/searchscreen.dart';
class Searchfield extends StatelessWidget {
  const Searchfield({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() =>  Searchscreen()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.005),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey, size: 22.sp),
            SizedBox(width: 8.w),
            Text(
              "Search products...",
              style: AppTextStyle.rTextRalewayBlack16w600.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
