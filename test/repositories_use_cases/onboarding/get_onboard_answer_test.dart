
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/onboarding/get_onboard_answers_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../datasource/network_service_test.dart';
import 'get_onboard_answer_test.mocks.dart';

// class NetworkServiceMock extends Mock implements NetworkService{}

@GenerateMocks([NetworkService])
main(){

  final service = MockNetworkService();

  final useCase = GetOnboardAnswersImpl(service);

  test('should return Right Onboard Model', () async {
    when(service.getOnboardingAnswer('lastAnswerId')).thenAnswer((_) async => OnboardModelMock());

    final result = await useCase('lastAnswerId');

    expect(result.fold(id, id), isA<OnboardModel>());
  });

  test('should return Left Exception', () async {
    when(service.getOnboardingAnswer('lastAnswerId')).thenThrow((_) async => Exception());

    final result = await useCase('lastAnswerId');

    expect(result.fold(id, id), isA<Exception>());
  });

}

