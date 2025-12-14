import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/features/members/data/data_source/firebase_members_remote_data_source_impl.dart';
import 'package:gym_management_system/features/members/data/data_source/members_remote_data_source.dart';
import 'package:gym_management_system/features/members/data/repository/member_repository_impl.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';
import 'package:gym_management_system/features/members/domain/usecases/add_member_use_case.dart';
import 'package:gym_management_system/features/members/domain/usecases/get_member_use_case.dart';
import 'package:gym_management_system/features/members/presentation/provider/add_member/add_member_notifier.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_notifier.dart';

void registerMemberDependencies() {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<MembersRemoteDataSource>(
    () => FirebaseMembersRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<MemberRepository>(() => MemberRepositoryImpl(sl()));

  sl.registerLazySingleton<AddMemberUseCase>(() => AddMemberUseCase(sl()));
  sl.registerLazySingleton<GetMembersUseCase>(() => GetMembersUseCase(sl()));

  sl.registerFactory<AddMemberNotifier>(() => AddMemberNotifier(sl()));
  sl.registerFactory<MemberListNotifier>(() => MemberListNotifier(sl()));
}
