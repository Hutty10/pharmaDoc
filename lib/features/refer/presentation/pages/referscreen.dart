import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:health_proj/features/refer/presentation/widgets/petientrefercard.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refarals'),
      ),
      body: ListView.separated(
        itemCount: 4,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        separatorBuilder: (_, __) => Gap(6.h),
        itemBuilder: (context, index) => const PatientReferCard(),
      ),
    );
  }
}
