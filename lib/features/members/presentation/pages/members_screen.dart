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

    return Scaffold(
      appBar: CustomAppBar(
        title: "Members",
        showBack: false,
        titleSpacing: 16.0,
        actions: [
            IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.filter_list_rounded), onPressed: () {}),
          ],
      ),

      body: SafeArea(
        child: RefreshIndicator(
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: Scrollbar(
            thumbVisibility: false,
            radius: const Radius.circular(12),
            thickness: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.screenPadding(context)),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppSizes.spaceM(context)),
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
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        
        backgroundColor: scheme.primaryContainer,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMemberScreen()),
          );
        },
        child: Icon(Icons.add,color: scheme.onPrimaryContainer,),
      ),
    );
  }
}
