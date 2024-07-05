import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/providers.dart';

class RememberPasswordWidget extends StatelessWidget {
  const RememberPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 18.r,
          height: 18.r,
          child: Consumer(builder: (context, ref, child) {
            return Checkbox(
              value: ref.watch(rememberPasswordProvider),
              onChanged: (value) {
                ref.read(rememberPasswordProvider.notifier).state = value!;
              },
              // activeColor: AppColors.grey600,
            );
          }),
        ),
        SizedBox(width: 9.w),
        Text(
          'Remember Password',
          style: theme.textTheme.labelSmall?.copyWith(
            // color: AppColors.grey600,
            letterSpacing: -0.12,
          ),
        ),
      ],
    );
  }
}
