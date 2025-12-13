import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/presentation/widgets/member_details/info_row.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

import '../widgets/member_details/deatils_card.dart';
import '../widgets/member_details/section_heading.dart';

class MemberDetailScreen extends StatelessWidget {
  final MemberEntity member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final formatedJoinDate = DateFormat('MMM dd, yyyy').format(member.joinDate);
    final formatedExpiryDate = DateFormat(
      'MMM dd, yyyy',
    ).format(member.expiryDate);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Member Details",
        actions: [IconButton(onPressed: () {}, icon: Icon(Iconsax.edit))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: AppSizes.spaceL(context) * 1.35,
                          backgroundColor: isDarkMode
                              ? scheme.primaryContainer
                              : scheme.primary,
                          child: Text(
                            member.fullName.trim()[0].toUpperCase(),
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isDarkMode
                                  ? scheme.onPrimaryContainer
                                  : scheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(width: AppSizes.spaceM(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                member.fullName,
                                style: textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      "#ID:${member.id}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: scheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(4),
                                    onTap: () {
                                      Clipboard.setData(
                                        ClipboardData(text: member.id),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Member ID copied"),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.copy_rounded,
                                      size: 14,
                                      color: scheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Chip(
                          visualDensity: VisualDensity.compact,
                          backgroundColor: member.isActive
                              ? scheme.secondaryContainer
                              : scheme.errorContainer,
                          label: Text(
                            member.isActive ? "Active" : "Inactive",
                            style: TextStyle(
                              color: member.isActive
                                  ? scheme.onSecondaryContainer
                                  : scheme.onErrorContainer,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),

                SectionHeading(title: "Membership Status", icon: Iconsax.card),

                DetailsCard(
                  rows: [
                    InfoRow(info: "Plan", value: member.membership),
                    Divider(),
                    InfoRow(info: "Fee", value: member.fee),
                    Divider(),
                    InfoRow(info: "join date", value: formatedJoinDate),
                    Divider(),
                    InfoRow(info: "Expiry date", value: formatedExpiryDate),
                  ],
                ),

                SectionHeading(
                  title: "Contact Information",
                  icon: Iconsax.call,
                ),

                DetailsCard(
                  rows: [
                    InfoRow(
                      info: "Mobile",
                      value: member.mobileNumber,
                      isCopyEnabled: true,
                    ),
                    Divider(),
                    InfoRow(
                      info: "E-mail",
                      value: member.email,
                      isCopyEnabled: true,
                    ),
                    Divider(),
                    InfoRow(info: "Address", value: member.address),
                  ],
                ),

                SectionHeading(
                  title: "Personal Information",
                  icon: Iconsax.personalcard,
                ),

                DetailsCard(
                  rows: [
                    InfoRow(
                      info: "Aadhaar number",
                      value: member.aadhaarNumber,
                    ),
                  ],
                ),

                SizedBox(height: AppSizes.spaceM(context)),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Renew membership"),
                  ),
                ),

                SizedBox(height: AppSizes.spaceM(context)),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? scheme.errorContainer
                          : scheme.error,
                      foregroundColor: isDarkMode
                          ? scheme.onErrorContainer
                          : scheme.onError,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Delete Member"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
