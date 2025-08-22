import 'package:flutter/material.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';

class Dshadowvertical{

  static final verticalproductShadow=BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0,2)
  );
}
class Dshadowhorizontal{

  static final horizontallproductShadow=BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0,2)
  );
}