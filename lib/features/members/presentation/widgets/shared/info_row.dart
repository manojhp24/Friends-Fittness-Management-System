import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoRow extends StatelessWidget {
  final String info;
  final String? value;
  final Widget? trailing;
  final bool isCopyEnabled;
  final Color? valueColor;

  const InfoRow({
    super.key,
    required this.info,
    this.value,
    this.isCopyEnabled = false,
    this.valueColor, this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label
          Expanded(
            flex: 3,
            child: Text(
              info,
              style: textTheme.labelMedium?.copyWith(
                color: valueColor ?? scheme.onSurfaceVariant,
              ), // FIXED typography
            ),
          ),

          // Value + copy icon
          Expanded(
            flex: 4,
            child: trailing ?? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: valueColor != null
                        ? BoxDecoration(
                      color: valueColor?.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    )
                        : null,
                    child: Text(
                      value!,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: valueColor ?? scheme.onSurface,
                      ),
                    ),
                  ),
                ),


                if (isCopyEnabled) ...[
                  const SizedBox(width: 6),
                  InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: value!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$info Copied")),
                      );
                    },
                    child: Icon(
                      Icons.copy_rounded,
                      size: 16,
                      color: scheme.primary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

