import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_proj/config/theme/app_colors.dart';
import 'package:health_proj/config/theme/app_textstyles.dart';

import '../widgets/patientsummarydatawidget.dart';

class ReferSummaryView extends StatelessWidget {
  const ReferSummaryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: Card(
                color: AppColors.flexSchemeDark.onErrorContainer,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.person),
                ),
              ),
              title: const Text('Name:\tSarah Founders'),
              subtitle: const Text('Status:\tPatient'),
            ),
            Text(
              'Specialist Review',
              style: AppTextstyles.mediumsemibold,
            ),
            Text(
              'From',
              style: AppTextstyles.mediumsemibold,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Card(
                color: AppColors.flexSchemeDark.onErrorContainer,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.person),
                ),
              ),
              subtitle: const Text('Senior Pharmacist'),
              title: Text(
                'Mr Charles ',
                style: AppTextstyles.mediumbold,
              ),
            ),
            const StyledTextDivider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Card(
                color: AppColors.flexSchemeDark.onErrorContainer,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.person),
                ),
              ),
              subtitle: const Text('Doctor'),
              title: Text(
                'Mary Sanders ',
                style: AppTextstyles.mediumbold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(
                'Referral Summary',
                style: AppTextstyles.mediumbold
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(15.0),
            const PatientSummaryDataWidget(),
          ],
        ),
      ),
    );
  }
}

class StyledTextDivider extends StatelessWidget {
  const StyledTextDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          indent: 10,
          endIndent: 10,
          thickness: 2,
        )),
        Text(
          'TO',
          style: AppTextstyles.mediumsemibold,
        ),
        const Expanded(
            child: Divider(
          indent: 10,
          endIndent: 10,
          thickness: 2,
        )),
      ],
    );
  }
}
