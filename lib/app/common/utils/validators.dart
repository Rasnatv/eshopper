// import 'package:get/get.dart';
//
// abstract class Validators {
//   static String? none() => null;
//
//   static String? validateEmpty(String? v) {
//     if (v!.isEmpty) {
//       return 'Field can\'t be empty';
//     } else {
//       return null;
//     }
//   }
//
//   static String? validatePhone(String? v, {int minLength = 10}) {
//     RegExp regex = RegExp(r'^[1-9]\d{10}$');
//
//     if (v!.isEmpty) {
//       return 'Phone number can\'t be empty';
//     } else if (v.length < minLength) {
//       return 'Enter valid phone number';
//     } else if (!v.isNumericOnly && !regex.hasMatch(v)) {
//       return 'Enter valid phone number';
//     }
//     return null;
//   }
// }
class LoginValidator {
  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.length < 4) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
