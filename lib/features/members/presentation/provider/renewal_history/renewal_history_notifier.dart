import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';
import 'package:gym_management_system/features/members/domain/usecases/get_renewal_use_case.dart';

class RenewalHistoryNotifier {
  final GetRenewalUseCase _getRenewalUseCase;

  RenewalHistoryNotifier(this._getRenewalUseCase);

  Stream<List<MemberRenewalEntity>> getRenewals(String memberID){
    return _getRenewalUseCase(memberID);
  }
}