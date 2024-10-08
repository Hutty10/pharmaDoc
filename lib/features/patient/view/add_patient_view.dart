import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:health_proj/features/patient/models/patient.dart';

import '../../../core/utils/validators.dart';
import '../providers/providers.dart';
import 'widgets/vitals_form_field.dart';

class AddPatientScreen extends ConsumerStatefulWidget {
  const AddPatientScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPatientScreenState();
}

class _AddPatientScreenState extends ConsumerState<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _stateOfOriginController = TextEditingController();
  bool _isLoaded = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _stateOfOriginController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // _formKey.currentState!.save();
      setState(() {
        _isLoaded = true;
      });
      final patient = Patient(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: _ageController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        stateOfOrigin: _stateOfOriginController.text,
      );
      try {
        ref.read(addPatientProvider(patient));
        log('Done adding Patient');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient details added successfully!')),
        );

        context.pop();
        ff() => ref.refresh(getPatientProvider);
        ff;
      } catch (e) {
        log('Error adding patient $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unable to add patient $e')),
        );
      } finally {
        setState(() {
          _isLoaded = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Patient'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PatientFormField(
                    controller: _firstNameController,
                    label: 'First Name',
                    hintText: 'Enter first name',
                    validator: Validator.nameValidator,
                  ),
                  PatientFormField(
                    controller: _lastNameController,
                    label: 'Last Name',
                    hintText: 'Enter last name',
                    validator: Validator.nameValidator,
                  ),
                  PatientFormField(
                    controller: _ageController,
                    label: 'Age',
                    hintText: 'Enter age',
                    validator: Validator.ageValidator,
                  ),
                  PatientFormField(
                    controller: _emailController,
                    label: 'Email',
                    hintText: 'Enter email',
                    validator: Validator.emailValidator,
                  ),
                  PatientFormField(
                    controller: _phoneController,
                    label: 'Phone',
                    hintText: 'Enter phone number',
                    validator: Validator.phoneValidator,
                  ),
                  PatientFormField(
                    controller: _addressController,
                    label: 'Address',
                    hintText: 'Enter address',
                    isDescription: true,
                  ),
                  PatientFormField(
                    controller: _stateOfOriginController,
                    label: 'State of Origin',
                    hintText: 'Enter state of origin',
                  ),
                  Gap(20.h),
                  Center(
                    child: ListenableBuilder(
                        listenable: Listenable.merge(
                          [
                            _firstNameController,
                            _lastNameController,
                            _ageController,
                            _phoneController,
                            _addressController,
                            _stateOfOriginController,
                          ],
                        ),
                        builder: (context, child) {
                          return FilledButton(
                            onPressed: _firstNameController.text.isNotEmpty &&
                                    _lastNameController.text.isNotEmpty &&
                                    _ageController.text.isNotEmpty &&
                                    _phoneController.text.isNotEmpty &&
                                    !_isLoaded
                                ? _submitForm
                                : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (_isLoaded) ...[
                                  const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(),
                                  ),
                                  const Gap(16),
                                ],
                                const Text('Add Patient'),
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
      ),
    );
  }
}
