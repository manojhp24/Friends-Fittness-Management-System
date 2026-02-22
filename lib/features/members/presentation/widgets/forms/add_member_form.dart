import 'package:flutter/material.dart';
import 'package:gym_management_system/core/validators/member_validators.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:intl/intl.dart';

import '../../../../../core/config/app_sizes.dart';
import '../shared/custom_input_field.dart';

class AddMemberForm extends StatefulWidget {
  final MemberEntity? member;
  const AddMemberForm({super.key, this.member});

  @override
  State<AddMemberForm> createState() => AddMemberFormState();
}

class AddMemberFormState extends State<AddMemberForm> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final aadhaarNumberController = TextEditingController();
  final feesController = TextEditingController();
  final paidAmountController = TextEditingController();
  final balanceController = TextEditingController();
  final addressController = TextEditingController();
  final joinDateController = TextEditingController();

  String? membership;
  DateTime? joinDate;
  String paymentStatus = "Paid"; // Paid / Partial / Unpaid

  bool validate() => _formKey.currentState?.validate() ?? false;

  final Map<String, String> membershipFee = {
    '1 month': '999',
    '3 months': '2699',
    '6 months': '4999',
    '1 year': '7499',
  };

  @override
  void initState() {
    super.initState();

    final member = widget.member;
    if (member != null) {
      fullNameController.text = member.fullName;
      phoneNumberController.text = member.mobileNumber;
      aadhaarNumberController.text = member.aadhaarNumber;
      feesController.text = member.fee;
      addressController.text = member.address;

      membership = member.membership;
      joinDate = member.joinDate;
      joinDateController.text = DateFormat('dd MMM yyyy').format(member.joinDate);

      paymentStatus = member.paymentStatus ?? "Paid";
      paidAmountController.text = member.paidAmount ?? "";
      balanceController.text = member.balance ?? "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomInputField(
            label: "Full Name",
            controller: fullNameController,
            validator: (v) => MemberValidators.requiredField(v, fieldName: "Full Name"),
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            controller: phoneNumberController,
            label: "Phone Number",
            keyboardType: TextInputType.phone,
            maxLength: 13,
            validator: MemberValidators.phone,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            controller: aadhaarNumberController,
            label: "Aadhaar Number",
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: membership,
                  decoration: const InputDecoration(labelText: "Membership"),
                  items: membershipFee.keys.map((plan) {
                    return DropdownMenuItem(
                      value: plan,
                      child: Text(plan),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      membership = value;
                      feesController.text = membershipFee[value]!;
                      if (paymentStatus == "Paid") {
                        paidAmountController.text = feesController.text;
                        balanceController.text = "0";
                      }
                    });
                  },
                  validator: (v) => v == null ? "Select membership" : null,
                ),
              ),

              SizedBox(width: AppSizes.spaceM(context)),

              Expanded(
                child: CustomInputField(
                  controller: feesController,
                  label: "Fee",
                  readOnly: true,
                  validator: MemberValidators.fee,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          DropdownButtonFormField<String>(
            initialValue: paymentStatus,
            decoration: const InputDecoration(labelText: "Payment Status"),
            items: ["Paid", "Partial", "Unpaid"].map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (v) {
              setState(() {
                paymentStatus = v!;
                if (paymentStatus == "Paid") {
                  paidAmountController.text = feesController.text;
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

            CustomInputField(
              label: "Paid Amount",
              controller: paidAmountController,
              keyboardType: TextInputType.number,
              onChanged: (val) {
                final fee = int.tryParse(feesController.text) ?? 0;
                final paid = int.tryParse(val) ?? 0;
                balanceController.text = (fee - paid).toString();
              },
              validator: (val) {
                if (paymentStatus == "Partial" && (val == null || val.isEmpty)) {
                  return "Enter paid amount";
                }
                return null;
              },
            ),

            SizedBox(height: AppSizes.spaceM(context)),

            CustomInputField(
              label: "Remaining Balance",
              controller: balanceController,
              readOnly: true,
            ),
          ],

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            controller: joinDateController,
            label: "Join Date",
            readOnly: true,
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: joinDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() {
                  joinDate = picked;
                  joinDateController.text = DateFormat('dd MMM yyyy').format(picked);
                });
              }
            },
            validator: (_) => joinDate == null ? "Select join date" : null,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            controller: addressController,
            label: "Address",
            maxLines: 4,
            alignLabelWithHint: true,
          ),

          SizedBox(height: AppSizes.spaceL(context)),
        ],
      ),
    );
  }
}
