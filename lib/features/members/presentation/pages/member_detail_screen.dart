// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/presentation/provider/delete_member/delete_member_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../widgets/tiles/action_button.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/shared/section_heading.dart';

import '../widgets/sections/member_header.dart';
import '../widgets/sections/membership_section.dart';

import '../widgets/sections/payment_section.dart';
import '../widgets/sections/personal_section.dart';

class MemberDetailScreen extends ConsumerWidget {
  final MemberEntity member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenDelete(ref, context);

    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Member Details",
        actions: [
          IconButton(
            onPressed: () => context.push('/update-member', extra: member),
            icon: const Icon(Iconsax.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.screenPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MemberHeader(member: member),

              SectionHeading(title: "Membership Status", icon: Iconsax.card),
              MembershipSection(member: member),

              SectionHeading(title: "Payment Info", icon: Iconsax.money),
              PaymentSection(member: member),

              SectionHeading(title: "Contact Information", icon: Iconsax.call),
              ContactSection(member: member),

              SectionHeading(
                title: "Personal Information",
                icon: Iconsax.personalcard,
              ),

              SizedBox(height: AppSizes.spaceM(context)),

              ActionButtons(member: member),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 DELETE LISTENER
  void _listenDelete(WidgetRef ref, BuildContext context) {
    ref.listen(deleteMemberNotifierProvider, (prev, next) {
      if (next.isSuccess == true) {
        AppSnackBar.success(context, "Member deleted successfully");

        if (context.mounted) {
          context.pop(true);
        }
      }

      if (next.error != null) {
        AppSnackBar.error(context, next.error!);
      }
    });
  }
}
