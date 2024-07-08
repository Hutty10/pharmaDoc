import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'widgets/vitals_form_field.dart';

class ReferPatientView extends ConsumerStatefulWidget {
  final String patientId;

  const ReferPatientView({
    super.key,
    required this.patientId,
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
                Text('Refer Patient ID: ${widget.patientId}',
                    style: theme.textTheme.titleLarge),
                Gap(16.h),
                PatientFormField(
                  controller: _locationController,
                  label: 'Doctor Location',
                  hintText: 'Enter Doctor Location',
                ),
                Gap(12.h),
                const Text('Doctor Name'),
                const Gap(6),
                DropdownButtonFormField<String>(
                  value: _selectedDoctor,
                  items: const [
                    DropdownMenuItem(
                        value: 'Dr. Smith', child: Text('Dr. Smith')),
                    DropdownMenuItem(
                        value: 'Dr. Johnson', child: Text('Dr. Johnson')),
                    DropdownMenuItem(value: 'Dr. Lee', child: Text('Dr. Lee')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedDoctor = value;
                    });
                  },
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
                Gap(16.h),
                PatientFormField(
                  controller: _pharmacistNoteController,
                  label: 'Pharmacist Note',
                  hintText: 'Enter pharmacist note',
                  isDescription: true,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Process the input data
                        // Save the data or send it to the server
                      }
                    },
                    child: const Text('Refer to Doc'),
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
