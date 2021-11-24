import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetFinanceGoalsImpl implements GetFinanceGoalsUseCase {

  final NetworkService service;

  GetFinanceGoalsImpl(this.service);

  @override
  Future<Either<Exception, FinanceGoals>> call() async {
    try {
      final result = await service.getFinanceGoals();
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }
  }
}