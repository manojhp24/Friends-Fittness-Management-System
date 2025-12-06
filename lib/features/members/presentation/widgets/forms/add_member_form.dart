import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';
import '../shared/custom_input_field.dart';

class AddMemberForm extends StatelessWidget {
  const AddMemberForm({super.key});


  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(label: "Full Name"),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            label: "Phone Number",
            keyboardType: TextInputType.phone,
            maxLines: 1,
            maxLength: 13,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            label: "Email",
            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
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
                  onChanged: (value) {},
                ),
              ),
              SizedBox(width: AppSizes.spaceM(context)),
              Expanded(child: CustomInputField(label: "Fee", readOnly: true)),
            ],
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
            label: "Join Date",
            readOnly: true,
            onTap: () async {
              await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                initialDate: DateTime.now(),
              );
            },
          ),

          SizedBox(height: AppSizes.spaceL(context)),

          CustomInputField(
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
