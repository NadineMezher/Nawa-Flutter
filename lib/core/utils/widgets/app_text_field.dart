// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:revibe/utils/app_themes.dart';

// import '../utils/app_assets.dart';
// import '../utils/app_colors.dart';
// import 'custom_icon.dart';

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     this.onTap,
//     this.hintText,
//     this.controller,
//     this.onSubimitted,
//     this.onTapSearch,
//     this.isEnabled = true,
//     super.key,
//   });

//   final void Function(String value)? onTapSearch;
//   final void Function()? onTap;
//   final String? hintText;
//   final TextEditingController? controller;
//   final void Function(String value)? onSubimitted;
//   final bool isEnabled;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onSubmitted: (value) {
//         if (value.isNotEmpty) {
//           onSubimitted!(value);
//         }
//       },
//       enabled: isEnabled,
//       // onTap: onTap,
//       cursorColor: AppColors.blackColor,
//       cursorHeight: 15.h,
//       textAlignVertical: TextAlignVertical.top,
//       controller: controller,
//       style: AppThemes.regularStyle.copyWith(height: 1),
//       decoration: InputDecoration(
//         isDense: true,
//         fillColor: AppColors.repurbleLightColor10Per,
//         filled: true,
//         hintText: hintText,
//         hintStyle: AppThemes.regularStyle.copyWith(height: 1),
//         border: customOutlineBorder(),
//         enabledBorder: customOutlineBorder(),
//         focusedBorder: customOutlineBorder(),
//         disabledBorder: customOutlineBorder(),
//         enabled: true,
//         suffixIcon: Padding(
//           padding: EdgeInsets.only(right: 15.w),
//           child: GestureDetector(
//             onTap: () {
//               if (controller!.text.isNotEmpty) {
//                 onTapSearch!(controller!.text);
//               }
//             },
//             child: const CustomIcon(
//               assetPath: AppAssets.iconSearch,
//             ),
//           ),
//         ),
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 18.w,
//           vertical: 16.h,
//         ),
//         suffixIconConstraints: BoxConstraints.tight(
//           Size(
//             40.w,
//             40.h,
//           ),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder customOutlineBorder() {
//     return OutlineInputBorder(
//       borderSide: const BorderSide(color: AppColors.transparentColor),
//       borderRadius: BorderRadius.circular(6.r),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final FocusNode focusNode;
  final String? labelText;
  final bool enabled;
  final Color textColor;
  final bool isFocused;
  final String? errorText;
  final Function onChange;
  final String? hintText;

  const AppTextField({super.key,
    required this.controller,
    required this.inputType,
    this.hintText,
    required this.focusNode,
    this.labelText,
    required this.textColor,
    required this.enabled,
    required this.errorText,
    required this.isFocused, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      keyboardType: inputType,
      controller: controller,
      onChanged: (value) {
        onChange(value);
      },
      focusNode: focusNode,
      // style: AppThemes.regularStyle.copyWith(
      //   color: textColor,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w600,
      // ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        // hintStyle: AppThemes.regularStyle.copyWith(
        //   color: AppColors.greyDarkColor,
        //   fontSize: 14.sp,
        //   fontWeight: FontWeight.w600,
        // ),
        // errorStyle: AppThemes.regularStyle.copyWith(
        //   fontSize: 12.sp,
        //   color: Colors.red,
        // ),
        // labelStyle: AppThemes.regularStyle.copyWith(
        //   color: errorText != null && errorText!.isNotEmpty ? Colors.red : isFocused ? AppColors.blackColor : AppColors.greyDarkColor,
        //   fontSize: 14.sp,
        //   fontWeight: FontWeight.w600,
        // ),
        filled: true,
        // fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.w),
        ),
      ),
    );
  }
}
