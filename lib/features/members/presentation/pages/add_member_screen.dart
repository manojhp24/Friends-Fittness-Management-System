import 'package:flutter/material.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';

import '../../../../core/config/app_sizes.dart';
import '../widgets/forms/add_member_form.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Member",titleSpacing: 0,),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.screenPadding(context)),
        child: AddMemberForm(),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(AppSizes.spaceM(context)),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Save Member"),
        ),
      ),

    );
  }
}
