
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';

class DBottomBar extends StatelessWidget {
  final String firstButtonText;
  final VoidCallback firstButtonAction;

  final String? secondButtonText;
  final VoidCallback? secondButtonAction;
  final IconData? secondButtonIcon;
  final Color? secondButtonColor;

  const DBottomBar({
    super.key,
    required this.firstButtonText,
    required this.firstButtonAction,
    this.secondButtonText,
    this.secondButtonAction,
    this.secondButtonIcon,
    this.secondButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          children: [
            if (secondButtonText != null && secondButtonAction != null)
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: secondButtonAction,
                  icon: Icon(secondButtonIcon ?? Icons.shopping_cart, color: Colors.white,),
                  label: Text(secondButtonText!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    secondButtonColor ?? AppColors.kPrimary
                        //Theme.of(context).primaryColor,
                  ),
                ),
              ),
            if (secondButtonText != null && secondButtonAction != null)
              SizedBox(width: 10.w),
            Expanded(
              child: ElevatedButton(
                onPressed: firstButtonAction,
                child: Text(firstButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
