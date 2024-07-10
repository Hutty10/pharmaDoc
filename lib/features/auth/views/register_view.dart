import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/core/utils/extensions/string_extension.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/router/route_path.dart';
import '../../../core/utils/validators.dart';
import '../controllers/provider/auth_notifier.dart';
import '../controllers/provider/providers.dart';
import '../models/register_param.dart';
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
      _passwordController,
      _userTypeController;

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
    _userTypeController.dispose();
    _licenseController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _enableButton() {
    return _firstnameController.text.isNotEmpty &&
        _lastnameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty;
  }

  Future<String?> _pickLicenseCertificateImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image.path;
    } else {
      return null;
    }
  }

  Future<void> _tryRegister(RegisterParams params) async {
    // final snackBar = ScaffoldMessenger.of(context);
    if (_formKey.currentState!.validate()) {
      await ref.read(authNotifierProvider.notifier).register(
          params.email,
          params.password,
          params.firstName,
          params.lastName,
          params.phoneNumber,
          params.userType,
          params.licenseCertificate);
      // if (ref.read(authNotifierProvider).error != null) {
      //   snackBar.showSnackBar(
      //     SnackBar(
      //       content: Text(ref.read(authNotifierProvider).error!),
      //     ),
      //   );
      // } else {}
    }
  }

  void _showCountdownSnackbar() {
    final snackBar = ScaffoldMessenger.of(context);
    int countdown = 5;

    snackBar.showSnackBar(
      SnackBar(
        duration: Duration(seconds: countdown),
        content: StatefulBuilder(
          builder: (context, setState) {
            Timer.periodic(const Duration(seconds: 1), (timer) {
              setState(() {
                countdown--;
                if (countdown == 0) {
                  timer.cancel();
                  // final routerLoc =
                  // if (routerLoc != '/login') {
                  context.go(RouteName.login.toPath);
                  // }
                }
              });
            });
            return Text(
                'Registered successfully. Proceed to login in $countdown seconds.');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next != previous &&
          next.error != previous?.error &&
          next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      } else if (next != previous &&
          previous?.error == next.error &&
          previous?.error == null &&
          next.isRegistered) {
        _showCountdownSnackbar();
      }
    });

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
                        'Create an account on PharmDoc',
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
                        // validator: Validator.phoneValidator,
                        label: 'Phone Number',
                        hintText: 'Enter your phone number',
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(20.h),
                      LabelTextField(
                        controller: _userTypeController,
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
                        onTap: () async {
                          final String? license =
                              await _pickLicenseCertificateImage();
                          if (license != null) {
                            _licenseController.text = license;
                          }
                        },
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
                          _passwordController,
                        ]),
                        builder: (context, child) {
                          final registerParams = RegisterParams(
                            email: _emailController.text,
                            firstName: _firstnameController.text,
                            lastName: _lastnameController.text,
                            password: _passwordController.text,
                            phoneNumber: _phoneNumberController.text,
                            userType: 'pharm',
                            licenseCertificate: File(_licenseController.text),
                          );
                          final authState = ref.watch(authNotifierProvider);
                          return FilledButton(
                            onPressed: _enableButton() || authState.isLoading
                                ? () {
                                    _tryRegister(registerParams);
                                  }
                                : null,
                            child: child,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (ref.read(authNotifierProvider).isLoading)
                              SizedBox(
                                height: 24.h,
                                width: 24.h,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                            Gap(16.h),
                            const Text('Sign Up'),
                          ],
                        ),
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
