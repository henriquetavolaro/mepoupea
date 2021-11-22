

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/onboarding/post_onboard_answers_impl.dart';
import 'package:mockito/mockito.dart';

import '../../datasource/network_service_test.dart';
import 'get_onboard_answer_test.mocks.dart';



main() {
  final service = MockNetworkService();

  final useCase = PostOnboardAnswersImpl(service);

  final answerModel = AnswerModel(answers: AnswerModelBody(pageId: "1"));

  test('should return Right int - code 200', () async {
    when(service.postOnboardingAnswer(answerModel)).thenAnswer((_) async => 200);

    final result = await useCase(answerModel);

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.getOnboardingAnswer('lastAnswerId')).thenThrow((_) async => Exception());

    final result = await useCase(answerModel);

    expect(result.fold(id, id), isA<Exception>());
  });
}