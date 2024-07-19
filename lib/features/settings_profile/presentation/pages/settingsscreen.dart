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
  late TextEditingController _firstNameController;
  late TextEditingController _genderController;
  String? newlicenseFile;
  late TextEditingController _licenseCertificateController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController currentpractisingstate;
  late TextEditingController _specializationController;
  late TextEditingController currentPractisingAddress;
  late TextEditingController _licenseNumberController;
  // Add controllers for other optional fields (gender, state, address, etc.)
  User? pharm;
  String? oldphoneNumber;

  @override
  void didChangeDependencies() {
    pharm = ref.watch(userDataProvider);
    oldphoneNumber = pharm!.phone;
    if (pharm != null) {
      // Set controllers for all fields
      currentpractisingstate =
          TextEditingController(text: pharm!.currentPractisingState)
            ..addListener(
              () {
                setState(() {
                  pharm = pharm!.copyWith(
                      currentPractisingState: currentpractisingstate.text);
                });
              },
            );
      currentPractisingAddress =
          TextEditingController(text: pharm!.currentPractisingAddress)
            ..addListener(
              () {
                setState(() {
                  pharm = pharm!.copyWith(
                      currentPractisingAddress: currentPractisingAddress.text);
                });
              },
            );

      _firstNameController = TextEditingController(text: pharm!.firstName)
        ..addListener(
          () {
            setState(() {
              pharm = pharm!.copyWith(firstName: _firstNameController.text);
            });
          },
        );
      _lastNameController = TextEditingController(text: pharm!.lastName)
        ..addListener(
          () {
            setState(() {
              pharm = pharm!.copyWith(lastName: _lastNameController.text);
            });
          },
        );
      _genderController = TextEditingController(text: pharm!.gender ?? '')
        ..addListener(
          () {
            setState(() {
              pharm = pharm!.copyWith(gender: _genderController.text);
            });
          },
        );
      _emailController = TextEditingController(text: pharm!.email)
        ..addListener(
          () {
            setState(() {
              pharm = pharm!.copyWith(email: _emailController.text);
            });
          },
        );
      _phoneController = TextEditingController(text: pharm!.phone)
        ..addListener(
          () {
            setState(() {
              pharm = pharm!.copyWith(phone: _phoneController.text);
            });
          },
        );
      _specializationController =
          TextEditingController(text: pharm!.specialization ?? '')
            ..addListener(
              () {
                setState(() {
                  pharm = pharm!
                      .copyWith(specialization: _specializationController.text);
                });
              },
            );
      _licenseCertificateController =
          TextEditingController(text: pharm!.licenseCertificate);
      _licenseNumberController = TextEditingController(
          text: pharm!.licenseNumber ?? '')
        ..addListener(
          () {
            setState(() {
              pharm =
                  pharm!.copyWith(licenseNumber: _licenseNumberController.text);
            });
          },
        );
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Doctor Profile'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            updateProfileData(context);
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
                enabled: false,
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
                enabled: false,
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
                enabled: false,
                controller: _genderController,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                enabled: false,
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
                controller: currentPractisingAddress,
                decoration: InputDecoration(
                  labelText: 'current_practising_address',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                controller: currentpractisingstate,
                decoration: InputDecoration(
                  labelText: 'current_practising_state',
                  constraints: const BoxConstraints(
                    minHeight: 100.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              TextField(
                enabled: false,
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
                enabled: false,
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
                controller: _licenseCertificateController,
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

                  String? newlicenseFile = await pickLicenseCertificateImage();
                  if (newlicenseFile != null) {
                    setState(() {
                      _licenseCertificateController.text = newlicenseFile;
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

  void updateProfileData(BuildContext context) {
    if (oldphoneNumber != pharm!.phone) {
      log(pharm.toString());
      var authService = AuthService(dio: ref.watch(dioProvider));
      authService.updateUserCredentials(pharm!, newlicenseFile, ref).then(
        (value) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'))
              ],
              title: const Text('Notification'),
              content: Text('${value['message']}'),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Update your phone number')));
    }
  }
}
