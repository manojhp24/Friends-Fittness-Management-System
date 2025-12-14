import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../provider/member_search_provider.dart';

class MemberSearchBar extends ConsumerWidget {
  const MemberSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.screenPadding(context),
        AppSizes.spaceM(context),
        AppSizes.screenPadding(context),
        AppSizes.spaceS(context),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search member...",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: scheme.surfaceContainerHigh,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          ref.read(memberSearchProvider.notifier).state = value;
        },
      ),
    );
  }
}
