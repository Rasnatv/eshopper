// import 'package:flutter/material.dart';
//
// class BottomCartBar extends StatelessWidget {
//   final String? title; // Optional label like "Total:"
//   final String? amount; // ✅ Now optional
//   final String? buttonText; // Optional button label
//   final VoidCallback? onPressed; // Optional action
//
//   const BottomCartBar({
//     super.key,
//     this.title,
//     this.amount,
//     this.buttonText,
//     this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         border: const Border(top: BorderSide(color: Colors.grey)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           if (amount != null)
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (title != null)
//                   Text(
//                     title!,
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 Text(
//                   amount!,
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
//                 ),
//               ],
//             ),
//           if (buttonText != null && onPressed != null)
//             ElevatedButton(
//               onPressed: onPressed,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: Text(
//                 buttonText!,
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';

class BottomCartBar extends StatelessWidget {
  final String? title;         // Optional label like "Total:"
  final String? amount;        // Optional amount like "₹1234"
  final String? buttonText;    // Optional button text
  final VoidCallback? onPressed; // Optional button action

  const BottomCartBar({
    super.key,
    this.title,
    this.amount,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LEFT: Amount Section
          if (amount != null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  Text(
                    amount!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )
          else
            const Spacer(),

          // RIGHT: Button
          if (buttonText != null && onPressed != null)
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
