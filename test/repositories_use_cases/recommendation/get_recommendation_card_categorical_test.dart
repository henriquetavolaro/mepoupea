import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards_categorical.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/recommendations/get_recommendation_card_categorical_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class RecommendationCardCategoricalMock extends Mock implements RecommendationsCardsCategorical {}

main(){

  final service = MockNetworkService();

  final useCase = GetRecommendationCardCategoricalImpl(service);

  test('should return Right RecommendationCardCategoricalMock', () async {
    when(service.getRecommendationCardCategorical('context')).thenAnswer((_) async => RecommendationCardCategoricalMock());

    final result = await useCase('context');

    expect(result.fold(id, id), isA<RecommendationsCardsCategorical>());
  });

  test('should return Left Exception', () async {
    when(service.getRecommendationCardCategorical('context')).thenThrow((_) async => Exception());

    final result = await useCase('context');

    expect(result.fold(id, id), isA<Exception>());
  });

}