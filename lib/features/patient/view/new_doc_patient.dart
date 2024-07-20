import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/extensions/string_extension.dart';
import '../../auth/views/widgets/label_textfield.dart';
import '../providers/providers.dart';

class SearchNewReferal extends ConsumerStatefulWidget {
  const SearchNewReferal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchNewReferalState();
}

class _SearchNewReferalState extends ConsumerState<SearchNewReferal> {
  late TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // String? name;
  // String? time;
  // String? serialNo;
  // String? id;

  // _trySearch() {
  //   try {
  //   final referal = ref.read(
  //     searchReferProvider(_searchController.text),
  //   );
  //  final data = referal.value;
  //   name = data['name'];

  //   } catch (e) {

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final searchResult = ref.watch(searchReferProvider(_searchController.text));
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search New Referal'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelTextField(
                controller: _searchController,
                label: 'Search by serial number',
                hintText: 'Enter serial number',
                // onChanged: (value) {
                //   if (value.isNotEmpty && value.length > 3) {
                //     ref.read(searchReferProvider(value));
                //   }
                // },
              ),
              const Gap(40),
              const Gap(20),
              // if (referal != null)

              searchResult.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => const Center(
                    child: Text('unable to load referal please try again')),
                data: (data) {
                  if (data.isEmpty) {
                    return const Text('No patient found');
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(1) Patient found',
                        style: theme.textTheme.titleMedium,
                      ),
                      const Gap(20),
                      Card(
                        elevation: 2,
                        surfaceTintColor: Colors.transparent,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Icon(Icons.man, size: 50.r),
                              ),
                              const Gap(8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data.first.patient.firstName} ${data.first.patient.lastName}',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Text(DateFormat('yyyy-MM-dd')
                                        .format(data.first.updatedAt)),
                                    ButtonBar(
                                      buttonPadding: EdgeInsets.zero,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'View Summary',
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text('Add Note'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
