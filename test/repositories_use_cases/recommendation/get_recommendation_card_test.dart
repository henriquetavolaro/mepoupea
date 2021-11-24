import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/recommendations/get_recommendation_card_impl.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class RecommendationCardMock extends Mock implements RecommendationsCards {}

main(){

  final service = MockNetworkService();

  final useCase = GetRecommendationCardImpl(service);

  test('should return Right RecommendationsCards', () async {
    when(service.getRecommendationCard('context')).thenAnswer((_) async => RecommendationCardMock());

    final result = await useCase('context');

    expect(result.fold(id, id), isA<RecommendationsCards>());
  });

  test('should return Left Exception', () async {
    when(service.getOnboardingAnswer('context')).thenThrow((_) async => Exception());

    final result = await useCase('context');

    expect(result.fold(id, id), isA<Exception>());
  });

}