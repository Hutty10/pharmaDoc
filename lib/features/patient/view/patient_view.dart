import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_path.dart';
import '../../../core/providers.dart';
import '../../../core/utils/extensions/string_extension.dart';
import '../models/patient.dart';
import '../providers/providers.dart';
import './widgets/patient_card.dart';

class PatientView extends ConsumerStatefulWidget {
  const PatientView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PatientViewState();
}

class _PatientViewState extends ConsumerState<PatientView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 10),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final role = ref.watch(userTypeProvider).value?.toLowerCase() ?? '';
    final patients = ref.watch(getPatientProvider);

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
      floatingActionButton: role == 'pharm'
          ? FloatingActionButton(
              onPressed: () => context.goNamed(
                RouteName.addPatient,
                pathParameters: {'tab': RouteName.patient},
              ),
              tooltip: 'Add Patient',
              child: const Icon(Icons.add),
            )
          : null,
      body: Column(
        children: [
          if (role == 'doc')
            TabBar(
              controller: _tabController,
              onTap: (index) {
                if (index > 0) {
                  context.goNamed(
                    RouteName.newDocPatient,
                    pathParameters: {'tab': RouteName.patient},
                  );
                  _tabController.index = 0;
                }
              },
              tabs: const [
                Tab(text: 'Consulted'),
                Tab(text: 'New'),
              ],
            ),
          Expanded(
            child: role == 'doc'
                ? TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      patients.when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        data: (patients) => PatientListView(
                          patients: patients,
                        ),
                        error: (error, _) => RefreshIndicator(
                          onRefresh: () =>
                              ref.refresh(getPatientProvider.future),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Unable to load patients'),
                              const Gap(16),
                              TextButton(
                                onPressed: () =>
                                    ref.refresh(getPatientProvider),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Center(
                        child: Text('Map'),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: RefreshIndicator(
                      onRefresh: () => ref.refresh(getPatientProvider.future),
                      child: patients.when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        data: (patients) => PatientListView(
                          patients: patients,
                        ),
                        error: (_, __) => SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Unable to load patients'),
                              const Gap(16),
                              TextButton(
                                onPressed: () =>
                                    ref.refresh(getPatientProvider),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class PatientListView extends StatelessWidget {
  const PatientListView({super.key, required this.patients});
  final List<Patient> patients;

  @override
  Widget build(BuildContext context) {
    if (patients.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
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
      );
    }
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 0.h),
      itemCount: patients.length,
      separatorBuilder: (context, index) => const Gap(4),
      itemBuilder: (context, index) {
        final patient = patients[index];
        return PatientCard(
          id: patient.id.toString(),
          phone: patient.phone,
          name: '${patient.firstName} ${patient.lastName}'.toTitleCase,
          time: patient.phone,
          serialNo: patient.patientSerial ?? '',
        );
      },
    );
  }
}
