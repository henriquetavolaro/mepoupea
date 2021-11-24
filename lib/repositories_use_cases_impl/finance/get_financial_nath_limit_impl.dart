import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetFinancialNathLimitImpl implements GetFinancialNathLimitUseCase {

  final NetworkService service;

  GetFinancialNathLimitImpl(this.service);

  @override
  Future<Either<Exception, CategoricalNathLimitsCosts>> call(String context) async {
    try {
      final result = await service.getFinanceNathLimit(context);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }  }
}