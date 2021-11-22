import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class DeleteFinanceGoalImpl implements DeleteFinanceGoalsUseCase {

  final NetworkService service;

  DeleteFinanceGoalImpl(this.service);

  @override
  Future<Either<Exception, int>> call(String goalId) async {
    try {
      final result = await service.deleteFinanceGoals(goalId);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}