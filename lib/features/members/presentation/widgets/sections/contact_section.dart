import 'package:flutter/material.dart';

import '../../../domain/entities/member_entity.dart';
import '../shared/deatils_card.dart';
import '../shared/info_row.dart';

class ContactSection extends StatelessWidget {
  final MemberEntity member;

  const ContactSection({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return DetailsCard(
      rows: [
        InfoRow(
          info: "Mobile",
          value: member.mobileNumber,
          isCopyEnabled: true,
        ),
        const Divider(),

        InfoRow(
          info: "Address",
          value: member.address.isEmpty ? "--" : member.address,
        ),
      ],
    );
  }
}