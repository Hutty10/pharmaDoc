import 'package:flutter/material.dart';

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

class PatientReferInfoText extends StatelessWidget {
  const PatientReferInfoText({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Text(info),
      ),
    ]);
  }
}
