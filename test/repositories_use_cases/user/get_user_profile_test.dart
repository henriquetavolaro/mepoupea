import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/user/get_user_profile_impl.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class UserProfileMock extends Mock implements UserProfile {}

main(){

  final service = MockNetworkService();

  final useCase = GetUserProfileImpl(service);

  test('should return Right UserProfile', () async {
    when(service.getUserProfile()).thenAnswer((_) async => UserProfileMock());

    final result = await useCase();

    expect(result.fold(id, id), isA<UserProfile>());
  });

  test('should return Left Exception', () async {
    when(service.getUserProfile()).thenThrow((_) async => Exception());

    final result = await useCase();

    expect(result.fold(id, id), isA<Exception>());
  });

}