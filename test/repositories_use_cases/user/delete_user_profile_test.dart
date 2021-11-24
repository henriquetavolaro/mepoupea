
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/user/delete_user_profile_impl.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = DeleteUserProfileImpl(service);

  test('should return Right int - code 200', () async {
    when(service.deleteUserProfile()).thenAnswer((_) async => 200);

    final result = await useCase();

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.deleteUserProfile()).thenThrow((_) async => Exception());

    final result = await useCase();

    expect(result.fold(id, id), isA<Exception>());
  });
}