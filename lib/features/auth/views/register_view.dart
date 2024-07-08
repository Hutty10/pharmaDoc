import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_path.dart';
// import '../../../core/constants/app_assets.dart';
import '../../../core/utils/validators.dart';
import '../providers/providers.dart';
import 'widgets/auth_rich_text.dart';
import 'widgets/google_button.dart';
import 'widgets/label_textfield.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _firstnameController,
      _lastnameController,
      _emailController,
      _phoneNumberController,
      _licenseController,
      _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _licenseController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _licenseController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _enableButton() {
    return _firstnameController.text.isNotEmpty &&
        _lastnameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    log('register build');
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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(top: 24.h, bottom: 60.h),
                    children: [
                      Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge,
                      ),
                      Gap(6.h),
                      Text(
                        'Create an account on Taskfuuse',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      Gap(32.h),
                      LabelTextField(
                        controller: _firstnameController,
                        validator: Validator.nameValidator,
                        label: 'First Name',
                        hintText: 'Enter first name',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(20.h),
                      LabelTextField(
                        controller: _lastnameController,
                        validator: Validator.nameValidator,
                        label: 'Last Name',
                        hintText: 'Enter last name',
                        keyboardType: TextInputType.name,
                      ),
                      Gap(20.h),
                      LabelTextField(
                        controller: _emailController,
                        validator: Validator.emailValidator,
                        label: 'Email Address',
                        hintText: 'Enter your email address',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(20.h),
                      LabelTextField(
                        controller: _phoneNumberController,
                        validator: Validator.phoneValidator,
                        label: 'Phone Number',
                        hintText: 'Enter your phone number',
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(20.h),
                      LabelTextField(
                        controller: _licenseController,
                        readOnly: true,
                        onTap: () {},
                        label: 'Specialist type',
                        hintText: 'Select your type',
                        // keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(20.h),
                      LabelTextField(
                        controller: _licenseController,
                        readOnly: true,
                        onTap: () {},
                        label: 'License/Certificate',
                        hintText: 'Upload your license',
                        // keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(20.h),
                      Consumer(
                        builder: (context, ref, child) {
                          final isVisible =
                              ref.watch(registerVisibilityProvider);
                          return LabelTextField(
                            controller: _passwordController,
                            // focusNode: _passwordFocus,
                            label: 'password',
                            hintText: 'Enter password',
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: !isVisible,
                            suffixIcon: IconButton(
                              onPressed: () {
                                ref
                                        .read(registerVisibilityProvider.notifier)
                                        .state =
                                    !ref
                                        .read(
                                            registerVisibilityProvider.notifier)
                                        .state;
                              },
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                            // onChanged: _onPasswordChanged,
                          );
                        },
                      ),
                      Gap(40.h),
                      ListenableBuilder(
                        listenable: Listenable.merge([
                          _firstnameController,
                          _lastnameController,
                          _emailController,
                          _passwordController
                        ]),
                        builder: (context, child) {
                          return FilledButton(
                            onPressed: _enableButton()
                                ? () => context.goNamed(RouteName.login)
                                : null,
                            child: child,
                          );
                        },
                        child: const Text('Get Started'),
                      ),
                      Gap(24.h),
                      if (Platform.isAndroid)
                        GoogleButton(
                          onPressed: () {},
                          label: 'Sign up with Google',
                        ),
                      SizedBox(height: 24.h),
                      AuthRichText(
                        onSecondaryTap: () => context.goNamed(RouteName.login),
                        primaryText: 'Already using health?',
                        secondaryText: 'Log in',
                      ),
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
