import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/costs_list.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetFinancialCostsImpl implements GetFinancialCostsUseCase {

  final NetworkService service;

  GetFinancialCostsImpl(this.service);

  @override
  Future<Either<Exception, CostsList>> call(String context) async {
    try {
      final result = await service.getFinancialCosts(context);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}