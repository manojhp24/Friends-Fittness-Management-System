import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/features/members/presentation/widgets/shared/empty_state_widget.dart';
import '../provider/renewal_history/renewal_history_provider.dart';

class MemberRenewalHistoryScreen extends ConsumerWidget {
  final String memberId;

  const MemberRenewalHistoryScreen({
    super.key,
    required this.memberId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final renewalAsync = ref.watch(renewalHistoryProvider(memberId));
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Renewal History",
        showBack: true,
      ),

      body: renewalAsync.when(
        loading: () =>
        const Center(child: CircularProgressIndicator()),

        error: (e, _) =>
            Center(child: Text("Error: $e")),

        data: (list) {
          if (list.isEmpty) {
            return EmptyStateWidget(icon: Icons.history, emptyMessage: "No renewal history");
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final data = list[index];
              final isPaid = data.paymentStatus == "Paid";

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Plan + Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.plan,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: isPaid
                                ? Colors.green.withValues(alpha: 0.1)
                                : Colors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            data.paymentStatus,
                            style: TextStyle(
                              color: isPaid ? Colors.green : Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// 🔹 Amount
                    Text(
                      "₹${data.paidAmount}",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: scheme.primary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// 🔹 Renewal Date (ONLY THIS)
                    Row(
                      children: [
                        const Icon(Icons.history, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(
                          "Renewed on: ${_formatDate(data.createdAt)}",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}