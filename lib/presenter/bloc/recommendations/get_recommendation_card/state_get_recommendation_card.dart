import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';

abstract class GetRecommendationCardState extends Equatable{}

class GetRecommendationCardInitialState extends GetRecommendationCardState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetRecommendationCardLoadingState extends GetRecommendationCardState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetRecommendationCardSuccessState extends GetRecommendationCardState {

  final RecommendationsCards recommendationsCards;

  GetRecommendationCardSuccessState(this.recommendationsCards);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetRecommendationCardErrorState extends GetRecommendationCardState {

  final Exception exception;

  GetRecommendationCardErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}