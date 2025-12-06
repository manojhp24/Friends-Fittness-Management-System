import 'package:flutter/material.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import '../../../../core/config/app_sizes.dart';
import '../../../../core/extensions/extensions.dart';
import '../widgets/shared/custom_input_field.dart';


class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Member",titleSpacing: 0,),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.screenPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// First + Last Name Row
            Row(
              children: [
                Expanded(child: CustomInputField(label: "First Name")),
                SizedBox(width: AppSizes.spaceM(context)),
                Expanded(child: CustomInputField(label: "Last Name")),
              ],
            ),

            SizedBox(height: AppSizes.spaceL(context)),

            CustomInputField(
              label: "Phone Number",
              keyboardType: TextInputType.phone,
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

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: scheme.primaryContainer,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.spaceM(context)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius(context)),
                  ),
                ),
                child: Text(
                  "Save Member",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.responsive
                      .bold
                      .copyWith(color: scheme.onPrimaryContainer),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
