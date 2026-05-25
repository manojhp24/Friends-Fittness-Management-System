import 'package:flutter/material.dart';
import '../../../../../core/config/app_sizes.dart';

class DetailsCard extends StatelessWidget {
  final List<Widget> rows;

  const DetailsCard({
    super.key,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: scheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radius(context),
        ),
        side: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: 0.7),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.cardPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        ),
      ),
    );
  }
}
