import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards_categorical.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';

class GetRecommendationCardCategoricalImpl extends GetRecommendationsCardsCategoricalUseCase {
  final NetworkService service;

  GetRecommendationCardCategoricalImpl(this.service);

  @override
  Future<Either<Exception, RecommendationsCardsCategorical>> call(String context) async {
    try {
      final result = await service.getRecommendationCardCategorical(context);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}