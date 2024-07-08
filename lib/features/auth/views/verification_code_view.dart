import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../config/router/route_path.dart';
import 'widgets/auth_rich_text.dart';

class VerificationCodeView extends ConsumerStatefulWidget {
  const VerificationCodeView({
    super.key,
    required this.email,
  });
  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationCodeViewState();
}

class _VerificationCodeViewState extends ConsumerState<VerificationCodeView> {
  late TextEditingController _codeController;
  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 72.h, 20.w, 0),
          child: Column(
            children: [
              Image.asset('assets/images/logo_112X22.png', height: 45.h),
              Gap(18.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                  children: [
                    Text(
                      'Verification Code',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge,
                    ),
                    Gap(6.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'We sent a code to ',
                            style: theme.textTheme.bodyLarge?.copyWith(),
                          ),
                          TextSpan(
                            text: widget.email,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(32.h),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: SizedBox(
                        width: 300.w,
                        height: 60.h,
                        child: PinInputTextFormField(
                          controller: _codeController,
                          pinLength: 4,
                          cursor: Cursor(
                            color: theme.colorScheme.primary,
                            height: 30.h,
                            width: 1,
                            enabled: true,
                          ),
                          decoration: BoxLooseDecoration(
                            gapSpace: 20.w,
                            textStyle: theme.textTheme.bodyMedium,
                            bgColorBuilder: PinListenColorBuilder(
                              theme.colorScheme.background,
                              theme.colorScheme.background,
                            ),
                            strokeColorBuilder: PinListenColorBuilder(
                              theme.colorScheme.secondaryContainer,
                              theme.colorScheme.secondaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(198.23.h),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _codeController,
                      builder: (context, value, child) {
                        return FilledButton(
                          onPressed: value.text.length == 4
                              ? () => context.goNamed(RouteName.newPassword)
                              : null,
                          child: child,
                        );
                      },
                      child: const Text('Continue'),
                    ),
                    SizedBox(height: 24.h),
                    AuthRichText(
                      onSecondaryTap: () =>
                          context.goNamed(RouteName.forgetPassword),
                      primaryText: 'Entered your email incorrectly?',
                      secondaryText: 'Change your email',
                      letterSpacing: -0.29,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
