import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/member_entity.dart';
import '../shared/deatils_card.dart';
import '../shared/info_row.dart';

class PaymentSection extends StatelessWidget {
  final MemberEntity member;

  const PaymentSection({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DetailsCard(
      rows: [
        InfoRow(info: "Payment", value: member.paymentStatus),
        const Divider(),

        InfoRow(info: "Paid", value: "${member.paidAmount} Rs"),

        if (int.parse(member.balance) > 0) ...[
          const Divider(),
          InfoRow(
            info: "Balance",
            value: "${member.balance} Rs",
            valueColor: scheme.error,
          ),
        ],

        const Divider(),

        InfoRow(
          info: "Renewal History",
          trailing: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>
                  context.push('/renewal-history', extra: member.id),
              child: const Text("View"),
            ),
          ),
        ),
      ],
    );
  }
}