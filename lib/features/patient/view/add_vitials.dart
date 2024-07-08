import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/vitals_form_field.dart';

class AddVitalsView extends StatefulWidget {
  const AddVitalsView({super.key, required this.patientId});
  final String patientId;

  @override
  State<AddVitalsView> createState() => _AddVitalsViewState();
}

class _AddVitalsViewState extends State<AddVitalsView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _vitalTypeController,
      _resultController,
      _remarksController;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _vitalTypeController = TextEditingController();
    _resultController = TextEditingController();
    _remarksController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _vitalTypeController.dispose();
    _resultController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  // String _selectedVitalType = 'Blood Pressure';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Patient Vitals'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DropdownButtonFormField<String>(
                //   value: _selectedVitalType,
                //   items: const [
                //     DropdownMenuItem(
                //         value: 'Blood Pressure', child: Text('Blood Pressure')),
                //     DropdownMenuItem(
                //         value: 'Blood Sugar', child: Text('Blood Sugar')),
                //     DropdownMenuItem(
                //         value: 'Heart Rate', child: Text('Heart Rate')),
                //     DropdownMenuItem(
                //         value: 'Body Temperature',
                //         child: Text('Body Temperature')),
                //   ],
                //   onChanged: (value) {
                //     if (value != null) {
                //       _selectedVitalType = value;
                //     }
                //   },
                //   decoration: InputDecoration(
                //     labelText: 'Vital Type',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.r),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please select a vital type';
                //     }
                //     return null;
                //   },
                // ),
                PatientFormField(
                  controller: _vitalTypeController,
                  label: 'Vitial Type',
                  hintText: 'eg Blood Pressure, Blood Sugar, etc.',
                ),
                // Gap(16.h),
                PatientFormField(
                  controller: _resultController,
                  label: 'Result',
                  hintText: 'eg 129/75',
                ),
                PatientFormField(
                  controller: _remarksController,
                  label: 'Remarks',
                  hintText: 'Enter remarks (optional)',
                  isDescription: true,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Process the input data
                        // Save the data or send it to the server
                      }
                    },
                    child: const Text('Save Vitals'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
