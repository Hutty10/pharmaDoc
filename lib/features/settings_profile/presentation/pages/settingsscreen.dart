import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:health_proj/core/providers.dart';
import 'package:health_proj/features/auth/controllers/provider/userprovider.dart';
import 'package:health_proj/features/auth/controllers/service/auth_service.dart';
import 'package:health_proj/features/auth/models/doctor.dart';
import 'package:health_proj/features/auth/models/user.dart';
import 'package:health_proj/features/auth/views/widgets/label_textfield.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/biocard.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/customprogresslisttile.dart';
import 'package:health_proj/features/settings_profile/presentation/widgets/optioncard.dart';
import 'package:image_picker/image_picker.dart';

class SettingsprofilePage extends StatelessWidget {
  const SettingsprofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditPatientScreen()));
            },
            child: const OptionCard(
              child: Icons.edit,
            ),
          )
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const BioCard(),
            const Divider(),
            CustomProgressListTile(
              icon: Icons.notifications,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Notifications',
            ),
            CustomProgressListTile(
              icon: Icons.security,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Security',
            ),
            CustomProgressListTile(
              icon: Icons.visibility,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Appearance',
            ),
            CustomProgressListTile(
              icon: Icons.help,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Help',
            ),
            CustomProgressListTile(
              icon: Icons.people_outlined,
              iconColor: Colors.blue,
              onTap: () {},
              text: 'Invite Friends',
            ),
            CustomProgressListTile(
              icon: Icons.logout,
              iconColor: Colors.red,
              onTap: () {},
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}

class EditPatientScreen extends ConsumerStatefulWidget {
  const EditPatientScreen({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPatientScreenState();
}

class _EditPatientScreenState extends ConsumerState<EditPatientScreen> {
  final _firstNameController = TextEditingController();
  final _licenseController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _specializationController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  // Add controllers for other optional fields (gender, state, address, etc.)
  User? pharm;

  @override
  void didChangeDependencies() {
    pharm = ref.watch(userDataProvider);
    if (pharm != null) {
      _firstNameController.text = pharm!.firstName;
      _lastNameController.text = pharm!.lastName;
      _emailController.text = pharm!.email;
      _phoneController.text = pharm!.phone;
      _specializationController.text =
          pharm!.specialization ?? ''; // Handle null value
      _licenseNumberController.text = pharm!.licenseNumber ?? '';
      // Set values for other controllers from the Doctor object
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    log(ref.watch(userDataProvider)!.toMap().toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Doctor Profile'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            var authService = AuthService(dio: ref.watch(dioProvider));
            authService.updateUserCredentials(pharm!, ref);
          },
          child: const Text('Update'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                controller: _specializationController,
                decoration: InputDecoration(
                  labelText: 'Specialization (Optional)',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                controller: _licenseNumberController,
                decoration: InputDecoration(
                  labelText: 'License Number (Optional)',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Gap(20.h),
              LabelTextField(
                controller: _licenseController,
                readOnly: true,
                onTap: () async {
                  Future<String?> pickLicenseCertificateImage() async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      return image.path;
                    } else {
                      return null;
                    }
                  }

                  final String? license = await pickLicenseCertificateImage();
                  if (license != null) {
                    setState(() {
                      _licenseController.text = license;
                    });
                  }
                },
                label: 'License/Certificate',
                hintText: 'Re-Upload your license',
                // keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              Gap(20.h),

              // Add TextFields for other optional fields (gender, state, address, etc.)
            ],
          ),
        ),
      ),
    );
  }
}
