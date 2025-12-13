import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/features/dashboard/presentation/widgets/dashboard/stats_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../members/presentation/provider/member_list/member_list_provider.dart';

class StatsGrid extends ConsumerWidget {
  const StatsGrid(
      {super.key, required this.textTheme, required this.scheme, required this.isDark});

  final TextTheme textTheme;
  final ColorScheme scheme;
  final bool isDark;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(memberListNotifierProvider);
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
          value: state.members.length.toString(),
          title: "Total Members",
          containerColor: isDark ? scheme.primaryContainer : scheme.primary,
          subTitleColor: isDark ? scheme.onSurfaceVariant : scheme.onPrimary,
          iconColor: isDark ? scheme.onSurfaceVariant : scheme.onPrimary,
          onTap: () {},
          subTitle: "",
        ),
        StatsCard(
          containerColor: isDark ? scheme.secondaryContainer : scheme.secondary,
          textTheme: textTheme,
          value: "45",
          title: "Active Members",
          icon: Iconsax.trend_up,
          subTitleColor: isDark ? scheme.onSecondaryContainer : scheme
              .onSecondary,
          iconColor: isDark ? scheme.onSecondaryContainer : scheme.onSecondary,
          onTap: () {},
          subTitle: "78.8% active rate",
        ),
        StatsCard(
          containerColor: isDark ? scheme.tertiaryContainer : scheme.tertiary,
          textTheme: textTheme,
          value: "Rs.12000",
          title: "Revenue",
          icon: Icons.currency_rupee,
          subTitleColor: isDark ? scheme.onTertiaryContainer : scheme
              .onTertiary,
          iconColor: isDark ? scheme.onTertiaryContainer : scheme.onTertiary,
          onTap: () {}, subTitle: 'This month',
        ),
        StatsCard(
          containerColor: isDark ? scheme.errorContainer : scheme.error,
          textTheme: textTheme,
          value: "18",
          title: "Expiring Soon",
          icon: Icons.notification_important,
          subTitleColor: isDark ? scheme.onErrorContainer : scheme.onError,
          iconColor: isDark ? scheme.onErrorContainer : scheme.onError,
          onTap: () {}, subTitle: 'Next 7 days',
        ),
      ],
    );
  }
}
