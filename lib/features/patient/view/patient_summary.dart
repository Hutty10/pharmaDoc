import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_path.dart';

class PatientSummaryView extends ConsumerWidget {
  final String patientId;

  const PatientSummaryView({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock data for demonstration purposes
    const patientName = "John Doe";
    const phoneNumber = "123-456-7890";
    const state = "California";
    const address = "123 Main St, Springfield, CA 12345";

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient ID: $patientId', style: theme.textTheme.titleLarge),
            Gap(16.h),
            Text('Name: $patientName', style: theme.textTheme.bodyLarge),
            Gap(8.h),
            Text('Phone: $phoneNumber', style: theme.textTheme.bodyLarge),
            Gap(8.h),
            Text('State: $state', style: theme.textTheme.bodyLarge),
            Gap(8.h),
            Text('Address: $address', style: theme.textTheme.bodyLarge),
            Gap(12.h),
            ButtonBar(
              buttonPadding: EdgeInsets.symmetric(horizontal: 8.w),
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => context
                      .go('/patient/$patientId/${RouteName.patientVitals}'),
                  child: const Text('View Vitals'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Appointments'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
