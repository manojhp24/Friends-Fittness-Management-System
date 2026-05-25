import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/widgets/app_snackbar.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/usecases/renew_member_usecase.dart';
import 'package:gym_management_system/features/members/presentation/provider/renew_member/renew_member_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../widgets/shared/deatils_card.dart';
import '../widgets/shared/info_row.dart';
import '../widgets/shared/section_heading.dart';
import '../widgets/shared/custom_input_field.dart';

class MemberRenewScreen extends ConsumerStatefulWidget {
  final MemberEntity member;

  const MemberRenewScreen({super.key, required this.member});

  @override
  ConsumerState<MemberRenewScreen> createState() => _MemberRenewScreenState();
}

class _MemberRenewScreenState extends ConsumerState<MemberRenewScreen> {
  // form fields
  String? membership;
  String paymentStatus = "Paid";

  final feeController = TextEditingController();
  final paidAmountController = TextEditingController();
  final balanceController = TextEditingController();

  // membership duration
  int _getMembershipDays(String plan) {
    switch (plan) {
      case "1 month":
        return 30;
      case "3 months":
        return 90;
      case "6 months":
        return 180;
      case "1 year":
        return 365;
      default:
        return 30;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final renewState = ref.watch(renewalMemberNotifierProvider);

    ref.listen(renewalMemberNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        AppSnackBar.success(context, "Member Renewed Successfully");
        if (context.mounted) Navigator.pop(context);
      }

      if (next.error != null) {
        AppSnackBar.error(context, next.error!);
      }
    });

    final membershipFee = {
      '1 month': '999',
      '3 months': '2699',
      '6 months': '4999',
      '1 year': '7499',
    };

    return Scaffold(
      appBar: CustomAppBar(title: "Renew Member"),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.screenPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSizes.spaceL(context) * 1.4,
                    backgroundColor: scheme.primary,
                    child: Text(
                      widget.member.fullName[0].toUpperCase(),
                      style: textTheme.headlineSmall?.copyWith(
                        color: scheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceM(context)),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.member.fullName,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                "#ID:${widget.member.id}",
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
                                  ClipboardData(text: widget.member.id),
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
                    label: Text(widget.member.isActive ? "Active" : "Inactive"),
                    backgroundColor: widget.member.isActive
                        ? scheme.secondaryContainer
                        : scheme.errorContainer,
                  ),
                ],
              ),

              SectionHeading(title: "Current Membership", icon: Iconsax.card),

              DetailsCard(
                rows: [
                  InfoRow(info: "Plan", value: widget.member.membership),
                  Divider(),
                  InfoRow(info: "Fee", value: widget.member.fee),
                  Divider(),
                ],
              ),

              SizedBox(height: AppSizes.spaceM(context)),

              Form(
                child: Column(
                  children: [
                    // Membership selector
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: "Membership"),
                      items: membershipFee.keys
                          .map(
                            (plan) => DropdownMenuItem(
                              value: plan,
                              child: Text(plan),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          membership = value;
                          feeController.text = membershipFee[value]!;
                        });
                      },
                    ),

                    SizedBox(height: AppSizes.spaceM(context)),

                    // Fee read only
                    CustomInputField(
                      label: "Fee",
                      readOnly: true,
                      controller: feeController,
                    ),

                    SizedBox(height: AppSizes.spaceM(context)),

                    // Payment status
                    DropdownButtonFormField(
                      decoration: InputDecoration(labelText: "Payment Status"),
                      initialValue: paymentStatus,
                      items: ["Paid", "Partial", "Unpaid"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          paymentStatus = v!;
                          if (v == "Paid") {
                            paidAmountController.text = feeController.text;
                            balanceController.text = "0";
                          } else {
                            paidAmountController.clear();
                            balanceController.clear();
                          }
                        });
                      },
                    ),

                    if (paymentStatus != "Paid") ...[
                      SizedBox(height: AppSizes.spaceM(context)),

                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              label: "Paid Amount",
                              controller: paidAmountController,
                              keyboardType: TextInputType.number,
                              onChanged: (v) {
                                final fee =
                                    int.tryParse(feeController.text) ?? 0;
                                final paid = int.tryParse(v) ?? 0;
                                balanceController.text = (fee - paid)
                                    .toString();
                              },
                            ),
                          ),
                          SizedBox(width: AppSizes.spaceM(context)),
                          Expanded(
                            child: CustomInputField(
                              label: "Balance",
                              readOnly: true,
                              controller: balanceController,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: ElevatedButton(
            onPressed: renewState.isLoading
                ? null
                : () async {
                    if (membership == null) return;

                    final params = RenewParams(
                      member: widget.member,
                      newPlan: membership!,
                      durationDays: _getMembershipDays(membership!),
                      fee: feeController.text,
                      paidAmount: paidAmountController.text.isEmpty
                          ? feeController.text
                          : paidAmountController.text,
                      balance: balanceController.text.isEmpty
                          ? "0"
                          : balanceController.text,
                      paymentStatus: paymentStatus,
                    );

                    await ref
                        .read(renewalMemberNotifierProvider.notifier)
                        .renew(params);
                  },
            child: renewState.isLoading
                ? const CircularProgressIndicator()
                : Text("Renew Member"),
          ),
        ),
      ),
    );
  }
}
