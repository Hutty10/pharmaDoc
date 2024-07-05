
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/route_path.dart';
import '../../../../core/constants/app_assets.dart';

class NewPasswordSuccess extends StatelessWidget {
  const NewPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 300,
      child: Padding(
        padding: EdgeInsets.fromLTRB(47.w, 12.h, 47.w, 55.h),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 3,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD0D5DD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            SizedBox(height: 33.h),
            SvgPicture.asset(AppAsset.successCheckIcon),
            SizedBox(height: 24.h),
            Text(
              'Successful',
              style: theme.textTheme.headlineMedium
                  ?.copyWith(color: theme.colorScheme.primary),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your password has been changed successfully',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                // color: AppColors.grey500,
                letterSpacing: -0.12,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            TextButton(
              onPressed: ()=>context.goNamed(RouteName.login),
              child: Text(
                'Continue',
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: theme.colorScheme.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
