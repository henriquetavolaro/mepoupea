import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class PostFinanceNathLimitImpl implements PostFinanceNathLimitUseCase {

  final NetworkService service;

  PostFinanceNathLimitImpl(this.service);

  @override
  Future<Either<Exception, int>> call(CategoricalNathLimitsCosts limitsCosts, String context) async {
    try {
      final result = await service.postFinanceNathLimit(limitsCosts, context);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }
  }
}