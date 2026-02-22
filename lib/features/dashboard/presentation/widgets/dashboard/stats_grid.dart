import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/features/dashboard/presentation/widgets/dashboard/stats_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../members/presentation/provider/member_list/member_list_provider.dart';

class StatsGrid extends ConsumerWidget {
  const StatsGrid({
    super.key,
    required this.textTheme,
    required this.scheme,
  });

  final TextTheme textTheme;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memberListNotifierProvider);

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSizes.spaceM(context),
      mainAxisSpacing: AppSizes.spaceM(context),
      childAspectRatio: 1,
      children: [
        StatsCard(
          title: "Total Members",
          value: state.members.length.toString(),
          icon: Iconsax.people,
          scheme: scheme,
          accentColor: scheme.primary,
        ),

        StatsCard(
          title: "Active Members",
          value: "45",
          icon: Iconsax.trend_up,
          scheme: scheme,
          accentColor: scheme.secondary,
          subTitle: "78.8% active rate",
        ),

        StatsCard(
          title: "Revenue",
          value: "₹12,000",
          icon: Icons.currency_rupee,
          scheme: scheme,
          accentColor: scheme.tertiary,
          subTitle: "This month",
        ),

        StatsCard(
          title: "Expiring Soon",
          value: "18",
          icon: Icons.notification_important,
          scheme: scheme,
          accentColor: scheme.error,
          subTitle: "Next 7 days",
        ),

      ],
    );
  }
}

