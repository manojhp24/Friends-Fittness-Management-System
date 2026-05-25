// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/helpers/get_membership_days.dart';
import 'package:gym_management_system/core/widgets/app_snackbar.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/core/widgets/loading_overlay.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/presentation/provider/add_member/add_member_provider.dart';
import 'package:gym_management_system/features/members/presentation/provider/update_member/update_member_provider.dart';
import 'package:gym_management_system/features/members/presentation/widgets/forms/member_form_content.dart';

import '../../../../core/config/app_sizes.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/helpers/string_helpers.dart';
import '../../../../core/services/notification_service.dart';
import '../widgets/forms/add_member_form.dart';

class AddMemberScreen extends ConsumerStatefulWidget {
  final MemberEntity? member;

  const AddMemberScreen({super.key, this.member});

  @override
  ConsumerState<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends ConsumerState<AddMemberScreen> {
  final formKey = GlobalKey<AddMemberFormState>();

  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.member?.isActive ?? true;
  }

  @override
  Widget build(BuildContext context) {
    _listenerState(context);

    final isLoading =
        ref.watch(addMemberNotifierProvider).isLoading ||
        ref.watch(updateMemberNotifierProvider).isLoading;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.member == null ? "Add Member" : "Update Member",
      ),

      body: Stack(
        children: [
          FormContent(
            formKey: formKey,
            member: widget.member,
            isActive: isActive,
            onActiveChanged: (val) => setState(() {
              isActive = val;
            }),
          ),

          if (isLoading) const LoadingOverlay(subtitle: "Saving member..."),
        ],
      ),

      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(AppSizes.spaceM(context)),
        child: ElevatedButton(
          onPressed: () {
            final form = formKey.currentState!;

            if (!form.validate()) {
              AppSnackBar.error(context, "Please fill the form correctly");
              return;
            }

            final days = getMembershipDays(form.membership!);
            final expiry = form.joinDate!.add(Duration(days: days));

            final memberEntity = MemberEntity(
              id: widget.member?.id ?? "",
              fullName: StringHelpers.capitalizeWords(
                form.fullNameController.text.trim(),
              ),
              mobileNumber: form.phoneNumberController.text.trim().replaceAll(
                " ",
                "",
              ),
              aadhaarNumber: "",
              // ❌ removed
              membership: form.membership!,
              fee: form.feesController.text.trim(),
              joinDate: form.joinDate!,
              expiryDate: expiry,
              address: form.addressController.text.trim(),
              isActive: isActive,

              paymentStatus: form.paymentStatus,
              paidAmount: form.paidAmountController.text.trim().isEmpty
                  ? "0"
                  : form.paidAmountController.text.trim(),
              balance: form.balanceController.text.trim().isEmpty
                  ? "0"
                  : form.balanceController.text.trim(),
            );

            if (widget.member == null) {
              ref
                  .read(addMemberNotifierProvider.notifier)
                  .addMember(memberEntity);
            } else {
              ref
                  .read(updateMemberNotifierProvider.notifier)
                  .updateMember(memberEntity);
            }
          },
          child: Text(widget.member == null ? "Save Member" : "Update Member"),
        ),
      ),
    );
  }

  void _listenerState(BuildContext context) {
    ref.listen(addMemberNotifierProvider, (prev, next) {
      if (next.successId != null) {
        AppSnackBar.success(context, "Member added successfully");
        if (context.mounted) Navigator.pop(context, true);
      }
      if (next.error != null) AppSnackBar.error(context, next.error!);
    });

    ref.listen(updateMemberNotifierProvider, (prev, next) {
      if (next.isSuccess) {
        AppSnackBar.success(context, "Member updated successfully");
        if (context.mounted) Navigator.pop(context, true);
      }
      if (next.error != null) AppSnackBar.error(context, next.error!);
    });
  }
}
