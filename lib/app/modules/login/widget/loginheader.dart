import 'package:flutter/material.dart';
import 'package:innsouls_flutter/app/common/constants/app_texts.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';
import 'package:innsouls_flutter/app/common/style/dimens.dart';

import '../../../common/constants/app_images.dart';
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(height: 150,width: 150,
         decoration: BoxDecoration(
             image:DecorationImage(image: AssetImage(AppImages.appSplachLogoImagePNG1,),fit:BoxFit.contain,)),),
        Text(AppTexts.logintitle,style: Theme.of(context).textTheme.headlineLarge!.apply(color: Colors.black)),
        Dimens.kSizedBoxH10,
        Text(AppTexts.loginsubtitle,style: Theme.of(context).textTheme.bodyMedium),
      ],);
  }
}

