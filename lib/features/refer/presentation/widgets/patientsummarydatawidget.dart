import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_proj/config/theme/app_textstyles.dart';

class PatientSummaryDataWidget extends StatelessWidget {
  const PatientSummaryDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(text: 'Pharmacist\'s Note\n', children: [
          TextSpan(
            text:
                'Mr Danny is highly sick with symptoms ranging from nljknbelvbdl lknklnvlk to ninaidv ainlvn,we nlnkdv nklnkvn lnlnavdklnlkadlkn aknvklna klankvln alknvklna aklnvkla alkndklva',
            style: AppTextstyles.mediumsemibold,
          ),
        ])),
        const Gap(30),
        Text.rich(TextSpan(text: 'Doctor\'s Note\n', children: [
          TextSpan(
            text:
                'Mr Danny is highly sick with symptoms ranging from nljknbelvbdl lknklnvlk to ninaidv ainlvn,we nlnkdv nklnkvn lnlnavdklnlkadlkn aknvklna klankvln alknvklna aklnvkla alkndklva',
            style: AppTextstyles.mediumsemibold,
          ),
        ])),
      ],
    );
  }
}
