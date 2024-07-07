import 'package:flutter/material.dart';
import 'package:health_proj/features/refer/presentation/widgets/patientreferinfotext.dart';

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
          itemBuilder: (context, index) => Card(
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
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(double.maxFinite, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text('View Summary'),
                    ),
                  ],
                )),
          )),
        ));
  }
}
