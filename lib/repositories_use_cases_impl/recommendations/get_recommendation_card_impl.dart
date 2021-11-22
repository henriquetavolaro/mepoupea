import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';

class GetRecommendationCardImpl extends GetRecommendationCardUseCase {
  final NetworkService service;

  GetRecommendationCardImpl(this.service);

  @override
  Future<Either<Exception, RecommendationsCards>> call(String context) async {
    try {
      final result = await service.getRecommendationCard(context);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

}
