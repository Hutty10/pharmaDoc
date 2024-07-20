import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/patient/providers/providers.dart';

import 'widgets/vitals_form_field.dart';

class AddVitalsView extends ConsumerStatefulWidget {
  const AddVitalsView({super.key, required this.patientPhone});
  final String patientPhone;

  @override
  ConsumerState<AddVitalsView> createState() => _AddVitalsViewState();
}

class _AddVitalsViewState extends ConsumerState<AddVitalsView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _vitalTypeController,
      _resultController,
      _remarksController;
  bool _isLoading = false;
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

  _trySubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final vitals = {
        'vital_type': _vitalTypeController.text,
        'result': _resultController.text,
        'remark': _remarksController.text,
        'patient_phone': widget.patientPhone,
      };
      try {
        setState(() {
          _isLoading = true;
        });
        ref.read(addPatientVitalProvider(vitals));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vitals added successfully'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
      // Process the input data
      // Save the data or send it to the server
    }
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
                  child: ListenableBuilder(
                      listenable: Listenable.merge([
                        _vitalTypeController,
                        _resultController,
                        _remarksController,
                      ]),
                      builder: (context, child) {
                        return ElevatedButton(
                          onPressed: _vitalTypeController.text.isNotEmpty &&
                                  _resultController.text.isNotEmpty &&
                                  _remarksController.text.isNotEmpty &&
                                  !_isLoading
                              ? _trySubmit
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (_isLoading) ...[
                                const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                const Gap(16)
                              ],
                              const Text('Save Vitals'),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
