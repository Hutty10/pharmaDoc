import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/config/router/route_path.dart';
import 'package:health_proj/core/utils/extensions/string_extension.dart';
import 'package:health_proj/features/refer/presentation/widgets/patientreferinfotext.dart';

import '../pages/refersummaryview.dart';

class PatientReferCard extends StatelessWidget {
  const PatientReferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const PatientReferInfoText(
                title: 'Patient',
                info: 'Mr Francis Sam',
              ),
              const PatientReferInfoText(
                title: 'Doctor',
                info: 'Charles Devoir',
              ),
              const PatientReferInfoText(
                title: 'Date:',
                info: ' 13/3/2090',
              ),
              OutlinedButton(
                onPressed: () {
                  context.go(RouteName.referPatientSummary);
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite * 0.25, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('View Summary'),
              ),
            ],
          )),
    ));
  }
}
