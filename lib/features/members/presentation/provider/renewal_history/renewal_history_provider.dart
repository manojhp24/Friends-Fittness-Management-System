
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../domain/usecases/get_renewal_use_case.dart';


final renewalHistoryProvider = StreamProvider.family<
    List<MemberRenewalEntity>, String>((ref, memberId) {
  final useCase = sl<GetRenewalUseCase>();
  return useCase(memberId);
});