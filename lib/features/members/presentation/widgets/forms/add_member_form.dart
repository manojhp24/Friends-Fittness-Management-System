import 'package:flutter/material.dart';
import 'package:gym_management_system/core/validators/member_validators.dart';

import '../../../../../core/config/app_sizes.dart';
import '../shared/custom_input_field.dart';

class AddMemberForm extends StatefulWidget {
  const AddMemberForm({super.key});

  @override
  State<AddMemberForm> createState() => AddMemberFormState();
}

class AddMemberFormState extends State<AddMemberForm> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final aadhaarNumberController = TextEditingController();
  final feesController = TextEditingController();
  final addressController = TextEditingController();
  final joinDateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? membership;
  DateTime? joinDate;

  bool validate() => _formKey.currentState?.validate() ?? false;

  void resetForm() {
    fullNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    aadhaarNumberController.clear();
    feesController.clear();
    addressController.clear();

    joinDateController.clear();
    joinDate = null;

    membership = null;

    setState(() {});
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
            validator: (value) =>
                MemberValidators.requiredField(value, fieldName: "Full Name"),
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            validator: (value) => MemberValidators.phone(value),
            controller: phoneNumberController,
            label: "Phone Number",
            keyboardType: TextInputType.phone,
            maxLines: 1,
            maxLength: 13,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            validator: (value) => MemberValidators.email(value),
            controller: emailController,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            validator: (value) => MemberValidators.aadhaar(value),
            controller: aadhaarNumberController,
            label: "Aadhaar Number",
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Membership"),
                  items: ["Basic", "Standard", "Premium"].map((p) {
                    return DropdownMenuItem(value: p, child: Text(p));
                  }).toList(),
                  onChanged: (value) {
                    membership = value;
                  },
                ),
              ),
              SizedBox(width: AppSizes.spaceM(context)),
              Expanded(
                child: CustomInputField(
                  controller: feesController,
                  validator: (value) => MemberValidators.fee(value),
                  label: "Fee",
                  keyboardType: TextInputType.numberWithOptions(),
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
                initialDate: DateTime.now(),
              );
              if (pickedDate != null) {
                joinDate = pickedDate;
                joinDateController.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }
            },
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            controller: addressController,
            label: "Address",
            maxLines: 5,
            alignLabelWithHint: true,
          ),
          SizedBox(height: AppSizes.spaceL(context)),
        ],
      ),
    );
  }
}
