import 'package:gym_management_system/core/use_case/base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

import '../entities/member_entity.dart';

class RenewMemberUsecase extends UseCase<DataState<void>, RenewParams> {
  final MemberRepository _memberRepository;

  RenewMemberUsecase(this._memberRepository);

  @override
  Future<DataState<void>> call(RenewParams params) {
    final now = DateTime.now();

    final baseDate = params.member.expiryDate.isBefore(now)
        ? now
        : params.member.expiryDate;

    final newExpiry = baseDate.add(Duration(days: params.durationDays));

    final updateMember = params.member.copyWith(
      membership: params.newPlan,
      fee: params.fee,
      paidAmount: params.paidAmount,
      paymentStatus: params.paymentStatus,
      balance: params.balance,
      expiryDate: newExpiry,
      isActive: true,
    );

    final memberRenewal = MemberRenewalEntity(
      plan: params.newPlan,
      fee: params.fee,
      paymentStatus: params.paymentStatus,
      paidAmount: params.paidAmount,
      balance: params.balance,
      startDate: baseDate,
      expiryDate: newExpiry,
      createdAt: DateTime.now(),
    );

    return _memberRepository.renewMember(updateMember, memberRenewal);
  }
}

class RenewParams {
  final MemberEntity member;
  final String newPlan;
  final int durationDays;
  final String fee;
  final String paidAmount;
  final String balance;
  final String paymentStatus;

  const RenewParams({
    required this.member,
    required this.newPlan,
    required this.durationDays,
    required this.fee,
    required this.paidAmount,
    required this.balance,
    required this.paymentStatus,
  });
}
