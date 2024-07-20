import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/providers.dart';

class PatientVitalsListScreen extends ConsumerWidget {
  final String patientId;

  const PatientVitalsListScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    log('Patient ID: $patientId');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitals List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ref.watch(getVitalsProvider(patientId)).when(
              data: (vitals) {
                if (vitals.isEmpty) {
                  return const Center(
                    child: Text('No vitals found for this patient'),
                  );
                }
                return ListView.builder(
                  itemCount: vitals.length,
                  itemBuilder: (context, index) {
                    final vital = vitals[index];
                    return Card(
                      elevation: 2,
                      surfaceTintColor: Colors.transparent,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Type: ${vital.vitalType}',
                                style: theme.textTheme.titleMedium),
                            Text('Result: ${vital.result}',
                                style: theme.textTheme.bodyMedium),
                            Text('Remarks: ${vital.remark}',
                                style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            ),

        // child: ListView.builder(
        //   itemCount: vitals.length,
        //   itemBuilder: (context, index) {
        //     final vital = vitals[index];
        //     return Card(
        //       elevation: 2,
        //       surfaceTintColor: Colors.transparent,
        //       color: Colors.white,
        //       child: Padding(
        //         padding: EdgeInsets.all(8.w),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text('Type: ${vital['type']}',
        //                 style: theme.textTheme.titleMedium),
        //             Text('Result: ${vital['result']}',
        //                 style: theme.textTheme.bodyMedium),
        //             Text('Remarks: ${vital['remarks']}',
        //                 style: theme.textTheme.bodyMedium),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
