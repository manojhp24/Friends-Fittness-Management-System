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
  final emailController = TextEditingController();
  final aadhaarNumberController = TextEditingController();
  final feesController = TextEditingController();
  final addressController = TextEditingController();
  final joinDateController = TextEditingController();

  String? membership;
  DateTime? joinDate;
  bool isActive = true;

  bool validate() => _formKey.currentState?.validate() ?? false;


  final Map<String, String> membershipFee = {
    '1 month': '999',
    '3 months': '2699',
    '6 months': '4999',
    '1 year': '7499',
  };

  bool get isUpdate => widget.member != null;

  @override
  void initState() {
    super.initState();

    final member = widget.member;
    if (member != null) {
      fullNameController.text = member.fullName;
      phoneNumberController.text = member.mobileNumber;
      emailController.text = member.email;
      aadhaarNumberController.text = member.aadhaarNumber;
      feesController.text = member.fee;
      addressController.text = member.address;

      membership = member.membership;
      joinDate = member.joinDate;

      joinDateController.text =
          DateFormat('dd MMM yyyy').format(member.joinDate);

      isActive = member.isActive;
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
            validator: (v) =>
                MemberValidators.requiredField(v, fieldName: "Full Name"),
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
            controller: emailController,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
            validator: MemberValidators.email,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            controller: aadhaarNumberController,
            label: "Aadhaar Number",
            keyboardType: TextInputType.number,
            validator: MemberValidators.aadhaar,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: membership,
                  decoration:
                  const InputDecoration(labelText: "Membership"),
                  items: membershipFee.keys.map((plan) {
                    return DropdownMenuItem(
                      value: plan,
                      child: Text(plan),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      membership = value;
                      feesController.text =
                          membershipFee[value] ?? '';
                    });
                  },
                  validator: (v) =>
                  v == null ? "Select membership" : null,
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

          CustomInputField(
            controller: joinDateController,
            label: "Join Date",
            readOnly: true,
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                initialDate: joinDate ?? DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  joinDate = pickedDate;
                  joinDateController.text =
                      DateFormat('dd MMM yyyy').format(pickedDate);
                });
              }
            },
            validator: (_) =>
            joinDate == null ? "Select join date" : null,
          ),

          SizedBox(height: AppSizes.spaceM(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Active Member",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Switch(
                value: isActive,
                onChanged: (v) => setState(() => isActive = v),
              ),
            ],
          ),

          SizedBox(height: AppSizes.spaceM(context)),

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
