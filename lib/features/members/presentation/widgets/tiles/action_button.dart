import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/features/members/presentation/widgets/shared/comfirm_dialog.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../domain/entities/member_entity.dart';
import '../../provider/delete_member/delete_member_provider.dart';

class ActionButtons extends ConsumerWidget {
  final MemberEntity member;

  const ActionButtons({super.key, required this.member});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => context.push('/renew-member', extra: member),
            child: const Text("Renew"),
          ),
        ),

        SizedBox(width: AppSizes.spaceM(context)),

        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: scheme.error),
            onPressed: () async {
              final confirm = await showConfirmDialog(
                context: context,
                title: "Delete Member",
                message: "Are you sure?",
              );

              if (confirm == true) {
                ref
                    .read(deleteMemberNotifierProvider.notifier)
                    .deleteMember(member.id);
              }
            },
            child: Text("Delete", style: TextStyle(color: scheme.onError)),
          ),
        ),
      ],
    );
  }
}
