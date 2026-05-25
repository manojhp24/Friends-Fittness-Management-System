import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../domain/entities/member_entity.dart';
import 'add_member_form.dart';

class FormContent extends StatelessWidget {
  final GlobalKey<AddMemberFormState> formKey;
  final MemberEntity? member;
  final bool isActive;
  final ValueChanged<bool> onActiveChanged;


  const FormContent({
    required this.formKey,
    required this.member,
    required this.isActive,
    required this.onActiveChanged,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.screenPadding(context)),
      child: Column(
        children: [
          AddMemberForm(key: formKey, member: member),


          SwitchListTile(
            value: isActive,
            title: const Text("Active Status"),
            subtitle: Text(isActive ? "Active" : "Inactive"),
            onChanged: onActiveChanged,
          ),
        ],
      ),
    );
  }
}