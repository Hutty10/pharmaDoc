import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PatientFormField extends StatelessWidget {
  const PatientFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.isDescription = false,
  });

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final String hintText;
  final bool isDescription;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const Gap(6),
          SizedBox(
            height: isDescription ? 100.h : null,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                constraints: isDescription
                    ? BoxConstraints(
                        minHeight: 100.h,
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              textAlignVertical: isDescription ? TextAlignVertical.top : null,
              expands: isDescription,
              minLines: isDescription ? null : 1,
              maxLines: isDescription ? null : 1,
              validator: validator ??
                  (hintText.toLowerCase().contains('optional')
                      ? null
                      : (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter $label';
                          }
                          return null;
                        }),
            ),
          ),
        ],
      ),
    );
  }
}
