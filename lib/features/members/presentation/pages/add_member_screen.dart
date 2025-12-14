import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/helpers/get_membership_days.dart';
import 'package:gym_management_system/core/widgets/app_snackbar.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/core/widgets/loading_overlay.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/presentation/provider/add_member/add_member_provider.dart';

import '../../../../core/config/app_sizes.dart';
import '../../../../core/helpers/string_helpers.dart';
import '../widgets/forms/add_member_form.dart';

class AddMemberScreen extends ConsumerWidget {
  final MemberEntity? member;

  AddMemberScreen({super.key, this.member});

  final formKey = GlobalKey<AddMemberFormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addMemberNotifierProvider, (prev, next) {
      if (next.successId != null) {
        AppSnackBar.success(
          context,
          member == null
              ? "Member added successfully"
              : "Member updated successfully",
        );
        if (context.mounted) {
          Navigator.pop(context, true);
        }
      }

      if (next.error != null) {
        AppSnackBar.error(context, next.error!);
      }
    });

    final state = ref.watch(addMemberNotifierProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: member == null ? "Add Member" : "Update Member",
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.screenPadding(context)),
            child: AddMemberForm(
              key: formKey,
              member: member,
            ),
          ),
          if (state.isLoading)
            const LoadingOverlay(subtitle: "Saving member..."),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(AppSizes.spaceM(context)),
        child: ElevatedButton(
          onPressed: () {
            final form = formKey.currentState!;

            if (!form.validate()) {
              AppSnackBar.error(
                context,
                "Please fill the form correctly",
              );
              return;
            }

            final days = getMembershipDays(form.membership!);

            final memberEntity = MemberEntity(
              id: member?.id ?? "",
              fullName: StringHelpers.capitalizeWords(
                  form.fullNameController.text),
              mobileNumber: form.phoneNumberController.text.trim().replaceAll(
                  " ", ""),
              aadhaarNumber: form.aadhaarNumberController.text.trim(),
              membership: form.membership!,
              fee: form.feesController.text.trim(),
              joinDate: form.joinDate!,
              expiryDate: form.joinDate!.add(Duration(days: days)),
              address: form.addressController.text.trim(),
              isActive: form.isActive,
              email: form.emailController.text.trim().toLowerCase(),
            );

            if (member == null) {
              ref
                  .read(addMemberNotifierProvider.notifier)
                  .addMember(memberEntity);
            } 
          },
          child: Text(
            member == null ? "Save Member" : "Update Member",
          ),
        ),
      ),
    );
  }
}
