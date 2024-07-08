import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_path.dart';
import '../../../core/utils/validators.dart';
import 'widgets/label_textfield.dart';

class ForgetPasswordView extends ConsumerStatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends ConsumerState<ForgetPasswordView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
              Gap(24.h),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                    children: [
                      Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Enter your registered email address to reset your password',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 48.h),
                      LabelTextField(
                        controller: _emailController,
                        validator: Validator.emailValidator,
                        label: 'Enter Address',
                        hintText: 'Enter your email address',
                      ),
                      SizedBox(height: 332.23.h),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _emailController,
                        builder: (context, value, child) {
                          return FilledButton(
                            onPressed: value.text.isNotEmpty
                                ? () {
                                    // if (_formKey.currentState!.validate()) {
                                    // context.read(authProvider).forgotPassword(
                                    //   email: _emailController.text,
                                    // );
                                    // }
                                    context.pushNamed(
                                      RouteName.verifyCode,
                                      queryParameters: {
                                        'email': _emailController.text
                                      },
                                    );
                                  }
                                : null,
                            child: child,
                          );
                        },
                        child: const Text('Continue'),
                      ),
                      SizedBox(height: 24.h),
                      TextButton(
                        onPressed: () => context.goNamed(RouteName.login),
                        child: Text(
                          'Back to login',
                          style: theme.textTheme.labelLarge?.copyWith(
                            // color: AppColors.primaryNew,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
