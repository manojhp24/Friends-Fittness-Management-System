import 'package:flutter/material.dart';

import '../../../domain/entities/member_entity.dart';
import '../shared/deatils_card.dart';
import '../shared/info_row.dart';

class PersonalSection extends StatelessWidget {
  final MemberEntity member;

  const PersonalSection({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return DetailsCard(
      rows: [
        InfoRow(
          info: "Aadhaar",
          value: member.aadhaarNumber.isEmpty ? "--" : member.aadhaarNumber,
        ),
      ],
    );
  }
}
