import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/core/utils/extensions/string_extension.dart';
import 'package:health_proj/features/auth/controllers/provider/userprovider.dart';

import '../../../core/constants/app_assets.dart';
import '../../patient/models/patient.dart';
import '../../patient/providers/providers.dart';
import '../providers/providers.dart';
import './widgets/glass_morphism.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    String name = ref.watch(userDataProvider) != null
        ? ref.watch(userDataProvider)!.firstName
        : 'Error';

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(AppAsset.logoX22, height: 35.h),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const Gap(16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: GlassMorphism(
                blur: 10,
                opacity: 0.1,
                color: theme.colorScheme.surface,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        // backgroundImage:
                        //     const AssetImage('assets/images/profile.jpg'),
                      ),
                      Gap(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Hello, ',
                              children: [
                                TextSpan(
                                  text: name,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: theme.colorScheme.inverseSurface,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.inverseSurface,
                            ),
                          ),
                          const Gap(4),
                          ref.watch(countProvider).when(
                                loading: () =>
                                    const CircularProgressIndicator(),
                                data: (data) => Text(
                                  '$data',
                                  style:
                                      theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: theme.colorScheme.inverseSurface,
                                    letterSpacing: -0.05,
                                  ),
                                ),
                                error: (error, _) => Text(
                                  '0',
                                  style:
                                      theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: theme.colorScheme.inverseSurface,
                                    letterSpacing: -0.05,
                                  ),
                                ),
                              ),
                          Text(
                            'Patients Onboarded',
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: theme.colorScheme.inverseSurface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(24.h),
            Text(
              'Recent Patients',
              style: theme.textTheme.headlineSmall,
            ),
            Gap(10.h),
            Expanded(
              child: ref.watch(getPatientProvider).when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    data: (data) {
                      final int count = data.length < 10 ? data.length : 10;
                      final lastElements = data.sublist(
                        data.length - count,
                        data.length,
                      );
                      if (lastElements.isEmpty) {
                        return const Center(
                          child: Text('No patients onboarded yet'),
                        );
                      }
                      return RecentPatientList(patients: lastElements);

                      // patients: data,
                    },
                    error: (error, _) => const Center(
                      child: Text('Error fetching patients'),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentPatientList extends StatelessWidget {
  const RecentPatientList({
    super.key,
    required this.patients,
  });
  final List<Patient> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        log(patients.length.toString());
        final patient = patients[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: ListTile(
            onTap: () => context.go('/patient/$index'),
            leading: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.transparent,
              child: const Icon(Icons.man), // Icon(Icons.woman)
              // backgroundImage:
              //     const AssetImage('assets/images/profile.jpg'),
            ),
            title: Text('${patient.firstName} ${patient.lastName}'.toTitleCase),
            subtitle: Text('Phone: ${patient.phone}'),
            trailing: const Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}
