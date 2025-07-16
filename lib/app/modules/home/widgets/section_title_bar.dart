import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';
import 'package:innsouls_flutter/app/common/style/app_text_style.dart';

class SectionTitleBar extends StatelessWidget {
  const SectionTitleBar({super.key, required this.title, this.onSeeAll});

  final String title;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: AppTextStyle.rTextRalewayBlack22w700),
        Spacer(),
        if (onSeeAll != null) ...[
          Text("See All", style: AppTextStyle.rTextRalewayBlack15w700),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: onSeeAll,
              icon: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: AppColors.kPrimary,
                  child: Center(child: Icon(Icons.arrow_forward_rounded, color: AppColors.white, size: 16.sp))))
        ]
      ],
    );
  }
}
