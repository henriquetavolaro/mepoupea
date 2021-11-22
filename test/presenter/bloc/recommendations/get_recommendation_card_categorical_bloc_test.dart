

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card_categorical/bloc_get_recommendation_card_categorical.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card_categorical/state_get_recommendation_card_categorical.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/recommendation/get_recommendation_card_categorical_test.dart';
import 'get_recommendation_card_categorical_bloc_test.mocks.dart';

@GenerateMocks([GetRecommendationsCardsCategoricalUseCase])
main(){

  final useCase = MockGetRecommendationsCardsCategoricalUseCase();

  final bloc = GetRecommendationCardCategoricalBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("context")).thenAnswer((_) async => Right(RecommendationCardCategoricalMock()));
    bloc.add(GetRecommendationCardCategoricalEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetRecommendationCardCategoricalLoadingState>(),
      isA<GetRecommendationCardCategoricalSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase("context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetRecommendationCardEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetRecommendationCardCategoricalLoadingState>(),
      isA<GetRecommendationCardCategoricalErrorState>()
    ]));
  });

}