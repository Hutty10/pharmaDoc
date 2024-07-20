import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/patient/providers/providers.dart';

import 'widgets/vitals_form_field.dart';

class ReferPatientView extends ConsumerStatefulWidget {
  final String patientId;
  final String patientSerialNo;

  const ReferPatientView({
    super.key,
    required this.patientId,
    required this.patientSerialNo,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReferPatientViewState();
}

class _ReferPatientViewState extends ConsumerState<ReferPatientView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pharmacistNoteController =
      TextEditingController();
  String? _selectedDoctor;
  bool _isLoading = false;

  _trySubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final data = {
        'doc_id': _selectedDoctor,
        'patient_id': widget.patientId,
        'pharm_note': _pharmacistNoteController.text,
      };
      if (FocusScope.of(context).focusedChild != null) {
        FocusScope.of(context).unfocus();
      }
      try {
        setState(() {
          _isLoading = true;
        });
        ref.read(referPatientProvider(data));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Patient successfully refered to doctor'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Refer Patient'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Refer Serial NO: ${widget.patientSerialNo}',
                    style: theme.textTheme.titleLarge),
                Gap(16.h),
                PatientFormField(
                  controller: _locationController,
                  label: 'Doctor Location',
                  hintText: 'Enter Doctor Location',
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      ref.read(getDoctorNAmeProvider(value));
                    }
                  },
                ),
                Gap(12.h),
                const Text('Doctor Name'),
                const Gap(6),
                Consumer(builder: (context, ref, child) {
                  if (_locationController.text.isEmpty) {
                    return const Text('Please enter a location');
                  }
                  final doctorsAsyncValue = ref
                      .watch(getDoctorNAmeProvider(_locationController.text));
                  return doctorsAsyncValue.when(
                    data: (doctors) {
                      return DropdownButton<String>(
                        value: _selectedDoctor,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedDoctor = value;
                          });
                        },
                        items: doctors
                            .map((doctor) => DropdownMenuItem<String>(
                                  value: doctor.$1,
                                  child: Text(doctor.$2),
                                ))
                            .toList(),
                      );
                    },
                    loading: () => DropdownButtonFormField<String>(
                      value: _selectedDoctor,
                      items: const [
                        DropdownMenuItem(
                          value: 'Loading...',
                          child: Text('Loading...'),
                        ),
                      ],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: 'Available Doctor',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a doctor';
                        }
                        return null;
                      },
                    ),
                    error: (e, st) => Text(
                        'Failed to get doctors for ${_locationController.text}'),
                  );
                }),
                Gap(16.h),
                PatientFormField(
                  controller: _pharmacistNoteController,
                  label: 'Pharmacist Note',
                  hintText: 'Enter pharmacist note',
                  isDescription: true,
                ),
                SizedBox(height: 20.h),
                ListenableBuilder(
                  listenable: Listenable.merge([
                    _locationController,
                    _pharmacistNoteController,
                  ]),
                  builder: (context, child) {
                    return FilledButton(
                      onPressed: _locationController.text.isNotEmpty &&
                              _pharmacistNoteController.text.isNotEmpty &&
                              !_isLoading
                          ? _trySubmit
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_isLoading) ...[
                            const CircularProgressIndicator(),
                            const Gap(8),
                          ],
                          const Text('Refer to Doc'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
