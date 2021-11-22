import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards_categorical.dart';

abstract class GetRecommendationCardCategoricalState extends Equatable{}

class GetRecommendationCardCategoricalInitialState extends GetRecommendationCardCategoricalState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetRecommendationCardCategoricalLoadingState extends GetRecommendationCardCategoricalState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetRecommendationCardCategoricalSuccessState extends GetRecommendationCardCategoricalState {

  final RecommendationsCardsCategorical recommendationsCardsCategorical;

  GetRecommendationCardCategoricalSuccessState(this.recommendationsCardsCategorical);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetRecommendationCardCategoricalErrorState extends GetRecommendationCardCategoricalState {

  final Exception exception;

  GetRecommendationCardCategoricalErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}