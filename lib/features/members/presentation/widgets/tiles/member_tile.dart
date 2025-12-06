import 'package:flutter/material.dart';
import '../../../../../core/config/app_sizes.dart';
import '../../../../../core/extensions/extensions.dart';

class MemberTile extends StatelessWidget {
  final String name;
  final String email;
  final String status;
  final String plan;
  final String expiryDate;
  final String daysLeft;

  const MemberTile({
    super.key,
    required this.name,
    required this.email,
    required this.status,
    required this.plan,
    required this.expiryDate,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: scheme.surfaceContainerLowest,
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          splashColor: scheme.primary.withOpacity(0.08),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// ---------- TOP ROW ----------
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppSizes.radius(context) * 1.9,
                      backgroundColor: scheme.primaryContainer,
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : "?",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.bold
                            .copyWith(color: scheme.primary),
                      ),
                    ),

                    const SizedBox(width: 14),

                    /// NAME + EMAIL
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.bold
                                .copyWith(color: scheme.onSurface),
                          ),
                          Text(
                            email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: scheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),

                    /// STATUS CHIP
                    Chip(
                      label: Text(
                        status,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.semiBold
                            .copyWith(color: scheme.onTertiaryContainer),
                      ),
                      backgroundColor: scheme.tertiaryContainer,
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    )
                  ],
                ),

                const SizedBox(height: 16),

                /// ---------- DETAILS + DAYS LEFT ----------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// Membership Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.badge, size: 18, color: scheme.onSurfaceVariant),
                            const SizedBox(width: 6),
                            Text(
                              plan,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.semiBold
                                  .copyWith(color: scheme.onSurface),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        Row(
                          children: [
                            Icon(Icons.calendar_today_rounded, size: 18, color: scheme.onSurfaceVariant),
                            const SizedBox(width: 6),
                            Text(
                              "Expires: $expiryDate",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: scheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Days Left Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: scheme.primaryContainer,
                      ),
                      child: Column(
                        children: [
                          Text(
                            daysLeft,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.bold
                                .copyWith(color: scheme.primary),
                          ),
                          Text(
                            "days left",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: scheme.primary.withOpacity(0.9)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
