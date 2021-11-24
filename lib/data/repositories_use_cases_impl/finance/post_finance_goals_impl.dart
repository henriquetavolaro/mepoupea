import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/finance_goal_input.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class PostFinanceGoalsImpl implements PostFinanceGoalsUseCase {

  final NetworkService service;

  PostFinanceGoalsImpl(this.service);

  @override
  Future<Either<Exception, int>> call(FinanceGoalInput financeGoalInput) async {
    try {
      final result = await service.postFinanceGoals(financeGoalInput);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }

  }
}