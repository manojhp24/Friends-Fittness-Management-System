import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';

class EmptyStateWidget extends StatelessWidget {

  final IconData icon;
  final String emptyMessage;

  const EmptyStateWidget({
    super.key, required this.icon, required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppSizes.iconSize(context) * 3,
            color: Theme
                .of(context)
                .colorScheme
                .onSurfaceVariant,
          ),
          SizedBox(height:AppSizes.spaceM(context) ),
          Text(
            emptyMessage,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ],
      ),
    );
  }
}