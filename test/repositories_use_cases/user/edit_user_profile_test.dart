import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/user/edit_user_profile_impl.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = EditUserProfileImpl(service);

  final userProfileEditable = UserProfileEditable(name: "name", email: "email", phone: "phone");

  test('should return Right int - code 200', () async {
    when(service.putUserProfile(userProfileEditable)).thenAnswer((_) async => 200);

    final result = await useCase(userProfileEditable);

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.putUserProfile(userProfileEditable)).thenThrow((_) async => Exception());

    final result = await useCase(userProfileEditable);

    expect(result.fold(id, id), isA<Exception>());
  });
}