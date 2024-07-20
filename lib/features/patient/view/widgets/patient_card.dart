import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/route_path.dart';
import '../../../../core/utils/extensions/string_extension.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.id,
    required this.name,
    required this.time,
    required this.phone,
    required this.serialNo,
  });
  final String id;
  final String name;
  final String time;
  final String phone;
  final String serialNo;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.go('/${RouteName.patient}/$phone'),
      child: Card(
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(Icons.man, size: 50.r),
              ),
              const Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toTitleCase,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(time),
                    ButtonBar(
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        TextButton(
                          onPressed: () => context.go(
                            '/${RouteName.patient}/$phone/${RouteName.addVitals}',
                          ),
                          child: const Text('Add Vitals'),
                        ),
                        TextButton(
                          onPressed: () => context.go(
                            '/${RouteName.patient}/$id/${RouteName.referPatient}?serial_no=$serialNo',
                          ),
                          child: const Text('Refer to Specialist'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
