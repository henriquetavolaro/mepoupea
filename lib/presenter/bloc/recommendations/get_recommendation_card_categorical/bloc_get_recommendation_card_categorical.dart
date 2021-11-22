import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card_categorical/state_get_recommendation_card_categorical.dart';

import '../../app_events.dart';

class GetRecommendationCardCategoricalBloc
    extends Bloc<AppEvents, GetRecommendationCardCategoricalState> {
  final GetRecommendationsCardsCategoricalUseCase useCase;

  GetRecommendationCardCategoricalBloc(this.useCase)
      : super(GetRecommendationCardCategoricalInitialState());

  @override
  Stream<GetRecommendationCardCategoricalState> mapEventToState(AppEvents event) async* {
    if (event is GetRecommendationCardCategoricalEvent) {
      yield GetRecommendationCardCategoricalLoadingState();
      final result = await useCase(event.context);
      yield result.fold((l) => GetRecommendationCardCategoricalErrorState(l),
              (r) => GetRecommendationCardCategoricalSuccessState(r));
    }
  }
}