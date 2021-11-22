import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards_categorical.dart';

abstract class GetRecommendationsCardsCategoricalUseCase {
  Future<Either<Exception, RecommendationsCardsCategorical>> call(String context);
}

abstract class GetRecommendationCardUseCase {
  Future<Either<Exception, RecommendationsCards>> call(String context);
}

