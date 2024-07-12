import 'dart:developer' show log;
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/auth/controllers/provider/userprovider.dart';
import 'package:health_proj/features/auth/models/doctor.dart';
import 'package:health_proj/features/auth/models/pharm.dart';

import '../../../config/router/route_path.dart';
import '../../../core/utils/extensions/string_extension.dart';
import '../controllers/provider/auth_notifier.dart';
import '../controllers/provider/providers.dart';
import '../providers/providers.dart';
import './widgets/auth_rich_text.dart';
import './widgets/google_button.dart';
import './widgets/label_textfield.dart';
import './widgets/remember_password_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController, _passwordController;
  @override
  initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // ref.read(loginProvider).dispose();
    super.dispose();
  }

  Future<void> _tryLogin(String email, String password) async {
    // final router = GoRouter.of(context);
    log(' dat recieved');
    await ref.read(authNotifierProvider.notifier).login(email, password).then(
      (value) {
        log(' dat recieved $value');
        if (value != null) {
          if (value['type'] == 'pharm') {
            ref
                .watch(userDataProvider.notifier)
                .assignUser(Pharm.fromJson(value));
          } else {
            ref
                .watch(userDataProvider.notifier)
                .assignUser(Doctor.fromJson(value));
          }
        }
      },
    );
    // router.go(RouteName.home.toPath);
  }

  @override
  Widget build(BuildContext context) {
    log('loginView build');

    final ThemeData theme = Theme.of(context);
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next != previous &&
          previous?.error == null &&
          !next.isLoggedIn &&
          next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
      if (next != previous && next.isLoggedIn) {
        context.go(RouteName.home.toPath);
      }
    });

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 72, 20, 0),
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
                      Text('Log in',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge
                          // ?.copyWith(color: theme.colorScheme.primary),
                          ),
                      Gap(6.h),
                      Text(
                        'Log in to your account',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      Gap(32.h),
                      LabelTextField(
                        controller: _emailController,
                        label: 'Email Address',
                        hintText: 'Enter email',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      Gap(24.h),
                      Consumer(
                        builder: (context, ref, child) {
                          final isVisible = ref.watch(loginVisibilityProvider);
                          return LabelTextField(
                            controller: _passwordController,
                            label: 'password',
                            hintText: 'Enter password',
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: !isVisible,
                            suffixIcon: IconButton(
                              onPressed: () {
                                ref
                                        .read(loginVisibilityProvider.notifier)
                                        .state =
                                    !ref
                                        .read(loginVisibilityProvider.notifier)
                                        .state;
                              },
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                          );
                        },
                      ),
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const RememberPasswordWidget(),
                          GestureDetector(
                            onTap: () =>
                                context.goNamed(RouteName.forgetPassword),
                            child: Text(
                              'Forgot Password?',
                              style: theme.textTheme.labelSmall?.copyWith(
                                letterSpacing: -0.12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(158.h),
                      ListenableBuilder(
                        listenable: Listenable.merge(
                          [_emailController, _passwordController],
                        ),
                        builder: (context, child) {
                          final bool enable =
                              _emailController.text.isNotEmpty &&
                                  _passwordController.text.length >= 8;
                          final authState = ref.watch(authNotifierProvider);
                          return FilledButton(
                            onPressed: enable && !authState.isLoading
                                ? () {
                                    FocusScope.of(context).unfocus();

                                    _tryLogin(
                                      _emailController.text,
                                      _passwordController.text,
                                    );
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
                            const Text('Log in'),
                          ],
                        ),
                      ),
                      Gap(24.h),
                      if (Platform.isAndroid)
                        GoogleButton(
                          onPressed: () {},
                          label: 'Continue with Google',
                        ),
                      Gap(24.h),
                      AuthRichText(
                        onSecondaryTap: () =>
                            context.goNamed(RouteName.register),
                        primaryText: 'Don\'t have an account?',
                        secondaryText: 'Create account',
                        letterSpacing: -0.12,
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
