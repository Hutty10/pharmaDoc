import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    const name = 'Hutty';
    const onb = 3000;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        // backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              // color: theme.colorScheme.inversePrimary,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, $name',
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '$onb',
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Patient Onoarded',
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(24.h),
            Text(
              'Recent Patients',
              style: theme.textTheme.headlineSmall,
            ),
            Gap(10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Ayomide Ayo $index'),
                    subtitle: Text('Item $index subtitle'),
                    // trailing: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
