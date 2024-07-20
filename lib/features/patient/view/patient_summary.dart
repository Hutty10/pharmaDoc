import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/core/utils/extensions/string_extension.dart';

import '../../../config/router/route_path.dart';
import '../providers/providers.dart';

class PatientSummaryView extends ConsumerWidget {
  final String patientPhone;

  const PatientSummaryView({super.key, required this.patientPhone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final patient = ref.watch(getPatientSingleProvider(patientPhone));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: patient.when(
          data: (patient) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Patient Serial No: ${patient.patientSerial}',
                    style: theme.textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: patient.patientSerial!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Serial number copied to clipboard'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Gap(16.h),
              Text('Name: ${patient.firstName} ${patient.lastName}'.toTitleCase,
                  style: theme.textTheme.bodyLarge),
              Gap(8.h),
              Text('Phone: ${patient.phone}', style: theme.textTheme.bodyLarge),
              Gap(8.h),
              Text('State of Origin: ${patient.stateOfOrigin}',
                  style: theme.textTheme.bodyLarge),
              Gap(8.h),
              Text('Address: ${patient.address}',
                  style: theme.textTheme.bodyLarge),
              Gap(12.h),
              ButtonBar(
                buttonPadding: EdgeInsets.symmetric(horizontal: 8.w),
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => context.go(
                        '/patient/${patient.id}/${RouteName.patientVitals}'),
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
          error: (error, _) => Center(
            child: Text(
              'Error: $error',
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
