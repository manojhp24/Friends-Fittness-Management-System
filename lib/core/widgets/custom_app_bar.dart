import 'package:flutter/material.dart';
import '../config/app_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBack;
  final double? titleSpacing;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
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
      automaticallyImplyLeading: false,

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
        if (actions != null) ...actions!,
        SizedBox(width: AppSizes.spaceS(context)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
