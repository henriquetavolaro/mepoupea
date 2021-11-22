import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card/state_get_recommendation_card.dart';

class GetRecommendationCardBloc
    extends Bloc<AppEvents, GetRecommendationCardState> {
  final GetRecommendationCardUseCase useCase;

  GetRecommendationCardBloc(this.useCase)
      : super(GetRecommendationCardInitialState());

  @override
  Stream<GetRecommendationCardState> mapEventToState(AppEvents event) async* {
    if (event is GetRecommendationCardEvent) {
      yield GetRecommendationCardLoadingState();
      final result = await useCase(event.context);
      yield result.fold((l) => GetRecommendationCardErrorState(l),
          (r) => GetRecommendationCardSuccessState(r));
    }
  }
}
