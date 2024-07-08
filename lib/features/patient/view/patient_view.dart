import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_path.dart';
import '../../../core/utils/extensions/string_extension.dart';
import './widgets/patient_card.dart';

class PatientView extends ConsumerWidget {
  const PatientView({super.key});

  bool get isEmpty => false;
  String get role => 'Doctor';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const Gap(16)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(
          RouteName.addPatient,
          pathParameters: {'tab': RouteName.patient},
        ),
        tooltip: 'Add Patient',
        child: const Icon(Icons.add),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            if (role == 'Doctor')
              TabBar(
                onTap: (index) {
                  if (index > 0) {
                    context.go(RouteName.settings.toPath);
                  }
                },
                tabs: const [
                  Tab(text: 'Consulted'),
                  Tab(text: 'New'),
                ],
              ),
            if (isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.group_off_outlined,
                      size: 120.r,
                    ),
                    Text(
                      'No Patients',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
            if (!isEmpty)
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 0.h),
                      itemCount: 10,
                      separatorBuilder: (context, index) => const Gap(4),
                      itemBuilder: (context, index) {
                        return PatientCard(
                          id: index.toString(),
                          name: 'Patient ${index + 1}'.capitalize,
                          time: DateTime.now(),
                        );
                      },
                    ),
                    const Center(
                      child: Text('Map'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
