import 'package:flutter/material.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';

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
        color: scheme.surfaceContainerLow,
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          splashColor: scheme.primary.withValues(alpha: 0.08),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// TOP ROW
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppSizes.radius * 1.9,
                      backgroundColor: scheme.primaryContainer,
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : "?",
                        style: TextStyle(
                          color: scheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: scheme.onSurface,
                            ),
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 13,
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// STATUS CHIP
                    Chip(
                      label: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: scheme.onTertiaryContainer,
                        ),
                      ),
                      backgroundColor: scheme.tertiaryContainer,
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    )

                  ],
                ),

                const SizedBox(height: 16),

                /// DETAILS + DAYS LEFT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// MEMBERSHIP INFO
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.badge,
                              size: 18,
                              color: scheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              plan,
                              style: TextStyle(color: scheme.onSurface),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              size: 18,
                              color: scheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Expires: $expiryDate",
                              style: TextStyle(color: scheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// DAYS LEFT BADGE
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: scheme.primaryContainer,
                      ),
                      child: Column(
                        children: [
                          Text(
                            daysLeft,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: scheme.primary,
                            ),
                          ),
                          Text(
                            "days left",
                            style: TextStyle(
                              fontSize: 12,
                              color: scheme.primary.withValues(alpha: 0.9),
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
