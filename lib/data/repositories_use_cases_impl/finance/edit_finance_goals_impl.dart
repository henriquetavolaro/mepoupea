import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class EditFinanceGoalsImpl implements EditFinanceGoalsUseCase {

  final NetworkService service;

  EditFinanceGoalsImpl(this.service);

  @override
  Future<Either<Exception, int>> call(FinanceGoal goal)async {
    try {
      final result = await service.putFinanceGoals(goal);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}