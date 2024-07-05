import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

// import '../../../core/constants/app_assets.dart';
import '../../../core/utils/validators.dart';
import '../providers/providers.dart';
import 'widgets/label_textfield.dart';
import 'widgets/new_password_success_bs.dart';

class NewPasswordView extends ConsumerStatefulWidget {
  const NewPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewPasswordViewState();
}

class _NewPasswordViewState extends ConsumerState<NewPasswordView> {
  late TextEditingController _passwordController, _cPasswordController;
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _cPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _cPasswordController.dispose();
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
              // SvgPicture.asset(AppAsset.logo),
              Gap(24.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                  children: [
                    Text(
                      'New Password',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge,
                    ),
                    Gap(32.h),
                    Consumer(
                      builder: (context, ref, child) {
                        final isVisible = ref.watch(showNewPasswordProvider);
                        return LabelTextField(
                          controller: _passwordController,
                          validator: Validator.passwordValidator,
                          label: 'Password',
                          hintText: 'Enter password',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: !isVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(showNewPasswordProvider.notifier).state =
                                  !ref
                                      .read(showNewPasswordProvider.notifier)
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
                    Gap(40.h),
                    Consumer(
                      builder: (context, ref, child) {
                        final isVisible = ref.watch(showNewCPasswordProvider);
                        return LabelTextField(
                          controller: _cPasswordController,
                          label: 'Confirm Password',
                          hintText: 'Enter password',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: !isVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref
                                      .read(showNewCPasswordProvider.notifier)
                                      .state =
                                  !ref
                                      .read(showNewCPasswordProvider.notifier)
                                      .state;
                            },
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    Gap(244.23.h),
                    ListenableBuilder(
                        listenable: Listenable.merge(
                          [_passwordController, _cPasswordController],
                        ),
                        builder: (context, child) {
                          return FilledButton(
                            onPressed: _passwordController.text.isNotEmpty &&
                                    _passwordController.text ==
                                        _cPasswordController.text
                                ? () => showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      builder: (_) =>
                                          const NewPasswordSuccess(),
                                    )
                                : null,
                            child: const Text('Continue'),
                          );
                        })
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
