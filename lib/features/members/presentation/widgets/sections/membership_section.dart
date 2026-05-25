import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/member_entity.dart';
import '../shared/deatils_card.dart';
import '../shared/info_row.dart';

class MembershipSection extends StatelessWidget {
  final MemberEntity member;

  const MembershipSection({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final displayDate = member.joinDate;
    final lastRenewalDate = member.lastRenewalDate;

    return DetailsCard(
      rows: [
        InfoRow(info: "Plan", value: member.membership),
        const Divider(),

        InfoRow(info: "Fee", value: member.fee),
        const Divider(),

        InfoRow(
          info: "Join Date",
          value: DateFormat("dd MMM yyyy").format(displayDate),
        ),
        const Divider(),

        InfoRow(
          info: "Last renewal",
          value: member.lastRenewalDate != null
              ? DateFormat("dd MMM yyyy").format(lastRenewalDate!)
              : "--",
        ),
        const Divider(),

        InfoRow(
          info: "Expiry Date",
          value: DateFormat("dd MMM yyyy").format(member.expiryDate),
        ),
      ],
    );
  }
}
