import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_sizes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/dashboard/action_button_section.dart';
import '../widgets/dashboard/dashboard_header.dart';
import '../widgets/dashboard/stats_grid.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Dashboard",
        showBack: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.screenPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardHeader(textTheme: textTheme, scheme: scheme),

            SizedBox(height: AppSizes.spaceM(context)),

            StatsGrid(textTheme: textTheme, scheme: scheme),
            SizedBox(height: AppSizes.spaceM(context)),

            Text(
              "Quick Actions",
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: scheme.onSurface,
              ),
            ),
            SizedBox(height: AppSizes.spaceM(context)),

            ActionButtonSection(),
          ],
        ),
      ),
    );
  }
}
