import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './app_colors.dart';

class AppTheme {
  static ThemeData theme() => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // textTheme: const TextTheme().apply(fontFamily: 'Inter'),
        colorScheme: AppColors.flexSchemeLight,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        filledButtonTheme: filledButtonThemeData,
        outlinedButtonTheme: outlinedButtonTheme,
        checkboxTheme: checkboxTheme,
      );

  static final InputDecorationTheme inputDecorationTheme =
      const InputDecorationTheme().copyWith(
    constraints: BoxConstraints(minHeight: 44.h),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.all(12.r),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      gapPadding: 12.w,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      gapPadding: 12.w,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      gapPadding: 12.w,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      gapPadding: 12.w,
    ),
  );
  static final FilledButtonThemeData filledButtonThemeData =
      FilledButtonThemeData(
    style: const ButtonStyle().copyWith(
      elevation: const MaterialStatePropertyAll<double>(0),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            // return AppColors.grey300;
          }
          return null;
          // return AppColors.primaryNew;
        },
      ),
      // foregroundColor: MaterialStateProperty.resolveWith(
      //   (states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       // return AppColors.grey500;
      //     }
      //     return null;
      //     // return AppColors.white;
      //   },
      // ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(48.h)),
      // textStyle: MaterialStatePropertyAll<TextStyle>(
      // AppTextTheme.appTextTheme.headlineMedium!,
      // ),
    ),
  );
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: const ButtonStyle().copyWith(
      elevation: const MaterialStatePropertyAll<double>(0),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            // return AppColors.grey300;
          }
          return null;
          // return AppColors.primaryNew;
        },
      ),
      // foregroundColor: MaterialStateProperty.resolveWith(
      //   (states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       // return AppColors.grey500;
      //     }
      //     return null;
      //     // return AppColors.white;
      //   },
      // ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(48.h)),
      // textStyle: MaterialStatePropertyAll<TextStyle>(
      // AppTextTheme.appTextTheme.headlineMedium!,
      // ),
    ),
  );
  static final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: const ButtonStyle().copyWith(
      elevation: const MaterialStatePropertyAll<double>(0),
      // foregroundColor: MaterialStateProperty.all<Color>(AppColors.grey500),
      side: const MaterialStatePropertyAll(
        BorderSide(
            // color: AppColors.grey400,
            ),
      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(48.h)),
      // textStyle: MaterialStatePropertyAll<TextStyle>(
      // AppTextTheme.appTextTheme.headlineMedium!,
      // ),
    ),
  );
  static CheckboxThemeData checkboxTheme = const CheckboxThemeData().copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    // side: const BorderSide(color: AppColors.grey400),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
