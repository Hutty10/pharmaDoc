import 'package:flutter/material.dart';
import 'package:health_proj/features/refer/presentation/widgets/patientreferinfotext.dart';
import 'package:health_proj/features/refer/presentation/widgets/petientrefercard.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Patients'),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => const PatientReferCard(),
        ));
  }
}
