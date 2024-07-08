import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientVitalsListScreen extends ConsumerWidget {
  final String patientId;

  const PatientVitalsListScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock data for demonstration purposes
    final List<Map<String, String>> vitals = [
      {'type': 'Blood Pressure', 'result': '120/80', 'remarks': 'Normal'},
      {'type': 'Blood Sugar', 'result': '90', 'remarks': 'Normal'},
      {'type': 'Heart Rate', 'result': '72', 'remarks': 'Normal'},
    ];

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitals List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView.builder(
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
                    Text('Type: ${vital['type']}',
                        style: theme.textTheme.titleMedium),
                    Text('Result: ${vital['result']}',
                        style: theme.textTheme.bodyMedium),
                    Text('Remarks: ${vital['remarks']}',
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
