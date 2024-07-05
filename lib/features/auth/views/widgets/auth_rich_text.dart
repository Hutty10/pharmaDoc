import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    super.key,
    required this.onSecondaryTap,
    required this.primaryText,
    required this.secondaryText,
    this.letterSpacing,
  });
  final GestureTapCallback onSecondaryTap;
  final String primaryText;
  final String secondaryText;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: '$primaryText ',
            style: theme.textTheme.titleMedium,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onSecondaryTap,
            text: secondaryText,
            style: theme.textTheme.labelLarge!.copyWith(
              decoration: TextDecoration.underline,
              letterSpacing: letterSpacing,
            ),
          ),
        ],
      ),
    );
  }
}
