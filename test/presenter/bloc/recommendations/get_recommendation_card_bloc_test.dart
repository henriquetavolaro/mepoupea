import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card/bloc_get_recommendation_card.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card/state_get_recommendation_card.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/recommendation/get_recommendation_card_test.dart';
import 'get_recommendation_card_bloc_test.mocks.dart';

// class UseCaseMock extends Mock implements GetRecommendationCardUseCase {}

@GenerateMocks([GetRecommendationCardUseCase])
main(){

  final useCase = MockGetRecommendationCardUseCase();

  final bloc = GetRecommendationCardBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("context")).thenAnswer((_) async => Right(RecommendationCardMock()));
    bloc.add(GetRecommendationCardEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetRecommendationCardLoadingState>(),
      isA<GetRecommendationCardSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase("context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetRecommendationCardEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetRecommendationCardLoadingState>(),
      isA<GetRecommendationCardErrorState>()
    ]));
  });

}