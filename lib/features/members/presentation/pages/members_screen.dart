import 'package:flutter/material.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/features/members/presentation/pages/add_member_screen.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/tiles/member_tile.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    AppSizes.init(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Members",
        showBack: false,
        titleSpacing: 16.0,
        action: Row(
          children: [
            IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.filter_list_rounded), onPressed: () {}),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: ListView.separated(
          itemCount: 13,
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSizes.spaceM),
          itemBuilder: (context, index) {
            return MemberTile(
              name: "Manoj",
              email: "manojhp584@gmail.com",
              plan: "Basic",
              expiryDate: "15/12/2025",
              daysLeft: "40",
              status: "Active",
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        
        backgroundColor: scheme.primaryContainer,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMemberScreen()),
          );
        },
        child: Icon(Icons.add,color: scheme.onPrimaryContainer,),
      ),
    );
  }
}
