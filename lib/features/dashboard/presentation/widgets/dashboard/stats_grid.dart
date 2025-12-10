import 'package:flutter/material.dart';
import 'package:gym_management_system/features/dashboard/presentation/widgets/dashboard/stats_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/config/app_sizes.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key, required this.textTheme, required this.scheme});

  final TextTheme textTheme;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSizes.spaceM(context),
      mainAxisSpacing: AppSizes.spaceM(context),
      childAspectRatio: AppSizes.responsiveAspectRatio(context) * 1.3,
      children: [
        StatsCard(
          textTheme: textTheme,
          icon: Iconsax.people,
          value: "70",
          title: "Total Members",
          containerColor: scheme.primaryContainer,
          subTitleColor: scheme.onSurfaceVariant,
          iconColor: scheme.onPrimaryContainer,
          onTap: () {},
          subTitle: "+12 this month",
        ),
        StatsCard(
          containerColor: scheme.secondaryContainer,
          textTheme: textTheme,
          value: "45",
          title: "Active Members",
          icon: Iconsax.trend_up,
          subTitleColor: scheme.onSecondaryContainer,
          iconColor: scheme.onSecondaryContainer,
          onTap: () {},
          subTitle: "78.8% active rate",
        ),
        StatsCard(
          containerColor: scheme.tertiaryContainer,
          textTheme: textTheme,
          value: "Rs.12000",
          title: "Revenue",
          icon: Icons.currency_rupee,
          subTitleColor: scheme.onTertiaryContainer,
          iconColor: scheme.onTertiaryContainer,
          onTap: () {}, subTitle: 'This month',
        ),
        StatsCard(
          containerColor: scheme.errorContainer,
          textTheme: textTheme,
          value: "18",
          title: "Expiring Soon",
          icon: Icons.notification_important,
          subTitleColor: scheme.onErrorContainer,
          iconColor: scheme.onErrorContainer,
          onTap: () {}, subTitle: 'Next 7 days',
        ),
      ],
    );
  }
}
