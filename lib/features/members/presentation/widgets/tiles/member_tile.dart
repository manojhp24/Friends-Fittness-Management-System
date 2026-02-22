import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../../core/extensions/extensions.dart';

class MemberTile extends StatelessWidget {
  final String name;
  final String mobile;
  final String status;
  final String plan;
  final String expiryDate;
  final String daysLeft;
  final void Function() onTap;

  const MemberTile({
    super.key,
    required this.name,
    required this.mobile,
    required this.status,
    required this.plan,
    required this.expiryDate,
    required this.daysLeft,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final days = int.parse(daysLeft);

    String topText;
    String bottomText;

    if (days < 0) {
      topText = "Expired";
      bottomText = "${days.abs()} days ago";
    } else if (days == 0) {
      topText = "Today";
      bottomText = "Expires";
    } else {
      topText = daysLeft.toString();
      bottomText = "days left";
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: scheme.surface, // FIXED
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          splashColor: scheme.primary.withValues(alpha: 0.08),
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
                            .copyWith(
                          color: scheme.onPrimaryContainer, // FIXED
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    /// NAME + MOBILE
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
                            mobile,
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
                            .copyWith(
                          color: scheme.onSecondaryContainer, // FIXED
                        ),
                      ),
                      backgroundColor:
                      scheme.secondaryContainer, // FIXED
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
                            Icon(
                              Icons.badge,
                              size: 18,
                              color: scheme.outline, // FIXED
                            ),
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
                            Icon(
                              Icons.calendar_today_rounded,
                              size: 18,
                              color: scheme.outline, // FIXED
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Expires: $expiryDate",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Days Left Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: scheme.primary, // FIXED
                      ),
                      child: Column(
                        children: [
                          Text(
                            topText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.bold
                                .copyWith(
                              color: scheme.onPrimary, // FIXED
                            ),
                          ),
                          Text(
                            bottomText,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                              color: scheme.onPrimary
                                  .withValues(alpha: 0.9), // FIXED
                            ),
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
