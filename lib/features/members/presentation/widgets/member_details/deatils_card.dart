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
      color: scheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radius(context),
        ),
        side: BorderSide(
          color: scheme.outlineVariant,
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
