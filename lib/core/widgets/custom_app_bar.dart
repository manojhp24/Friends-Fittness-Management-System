import 'package:flutter/material.dart';

import '../config/app_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final bool showBack;
  final double? titleSpacing;

  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
    this.showBack = true,
    this.titleSpacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      titleSpacing: titleSpacing,
      leading: showBack
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppSizes.iconSize(context),
                color: scheme.onSurfaceVariant,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: 0.15,
        ),
      ),
      actions: [
        if (action != null) action!,
        SizedBox(width: AppSizes.spaceS(context)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
