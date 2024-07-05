import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LabelTextField extends StatefulWidget {
  const LabelTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.labelColor,
    this.readOnly = false,
    this.onTap,
  });
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String?>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? labelColor;
  final bool readOnly;
  final GestureTapCallback? onTap;

  @override
  State<LabelTextField> createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  @override
  void initState() {
    super.initState();
    if (widget.keyboardType == TextInputType.phone &&
        !widget.controller.text.startsWith('+234')) {
      widget.controller.text = '+234';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: theme.textTheme.labelLarge?.copyWith(
              // color: labelColor ?? AppColors.grey500,
              ),
        ),
        Gap(6.h),
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          validator: widget.validator,
          // style: theme.textTheme.labelLarge?.copyWith(color: AppColors.grey900),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              labelText: widget.hintText, suffixIcon: widget.suffixIcon),
        )
      ],
    );
  }
}
