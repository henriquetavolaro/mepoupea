import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetCategoricalCostsImpl implements GetCategoricalCostsUseCase {

  final NetworkService service;

  GetCategoricalCostsImpl(this.service);

  @override
  Future<Either<Exception, CategoricalCosts>> call(String date, String context) async {
    try {
      final result = await service.getCategoricalCosts(date, context);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }
  }

}