import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/model/costs_list.dart';
import 'package:mepoupeapp/domain/model/finance_balance.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/domain/model/finance_goal_input.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';
import 'package:mepoupeapp/domain/model/finance_selfie.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';

abstract class GetCategoricalCostsUseCase {
  Future<Either<Exception, CategoricalCosts>> call(
      String date, String context);
}

abstract class GetFinanceBalanceUseCase {
  Future<Either<Exception, FinanceBalance>> call();
}

abstract class GetFinanceGoalsUseCase {
  Future<Either<Exception,FinanceGoals>> call();
}

abstract class GetFinancialCostsUseCase {
  Future<Either<Exception,CostsList >> call(String context);
}

abstract class GetFinancialNathLimitUseCase {
  Future<Either<Exception,CategoricalNathCostsDetails>> call(
      String context);
}

abstract class GetFinancialSelfieUseCase {
  Future<Either<Exception,FinanceSelfie>> call(String date);
}

abstract class GetWealthSelfieUseCase {
  Future<Either<Exception,WealthSelfie>> call();
}

abstract class PostFinanceGoalsUseCase {
  Future<Either<Exception,int>> call(
      FinanceGoalInput financeGoalInput);
}

abstract class PostFinanceMovementUseCase {
  Future<Either<Exception, int>> call(
      FinanceTransactionInput spent, String context);
}

abstract class PostFinanceNathLimitUseCase {
  Future<Either<Exception, int>> call(
      CategoricalNathLimitsCosts limitsCosts, String context);
}

abstract class EditFinanceGoalsUseCase {
  Future<Either<Exception,int>> call(FinanceGoal goal);
}

// abstract class PatchCostListDetailsUseCase {
//   Future<Either<Exception, int>> patchCostListDetails(String costId, String category);
// }

abstract class DeleteFinanceGoalsUseCase {
  Future<Either<Exception, int>> call(String goalId);
}
