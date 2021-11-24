import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/domain/model/finance_goal_input.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';

abstract class AppEvents extends Equatable {
  const AppEvents();

  @override
  List<Object?> get props => [];
}

//USER
class DeleteUserProfileEvent extends AppEvents {}

class EditUserProfileEvent extends AppEvents {
  final UserProfileEditable userProfileEditable;

  const EditUserProfileEvent(this.userProfileEditable);

  @override
  List<Object?> get props => [userProfileEditable];

}

class GetUserProfileEvent extends AppEvents {}

// RECOMMENDATIONS

class GetRecommendationCardCategoricalEvent extends AppEvents {
  final String context;

  const GetRecommendationCardCategoricalEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class GetRecommendationCardEvent extends AppEvents {
  final String context;

  const GetRecommendationCardEvent(this.context);

  @override
  List<Object?> get props => [context];
}

// ONBOARDING

class GetOnboardingAnswersEvent extends AppEvents {
  final String lastAnswerId;

  const GetOnboardingAnswersEvent(this.lastAnswerId);

  @override
  List<Object?> get props => [lastAnswerId];
}

class PostOnboardingAnswersEvent extends AppEvents {
  final AnswerModel answerModel;

  const PostOnboardingAnswersEvent(this.answerModel);

  @override
  List<Object?> get props => [answerModel];
}

// FINANCE

class DeleteFinanceGoalEvent extends AppEvents {
  final String goalId;

  const DeleteFinanceGoalEvent(this.goalId);

  @override
  List<Object?> get props => [goalId];
}

class EditFinanceGoalsEvent extends AppEvents {
  final FinanceGoal goal;

  const EditFinanceGoalsEvent(this.goal);

  @override
  List<Object?> get props => [goal];
}

class GetCategoricalCostsEvent extends AppEvents {
  final String date;
  final String context;

  const GetCategoricalCostsEvent(this.date, this.context);

  @override
  List<Object?> get props => [date, context];
}

class GetFinanceBalanceEvent extends AppEvents {}

class GetFinanceGoalsEvent extends AppEvents {}

class GetFinancialCostsEvent extends AppEvents {
  final String context;

  const GetFinancialCostsEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class GetFinancialNathLimitEvent extends AppEvents {
  final String context;

  const GetFinancialNathLimitEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class GetFinancialSelfieEvent extends AppEvents {
  final String date;

  const GetFinancialSelfieEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class GetWealthSelfieEvent extends AppEvents {}

class PostFinanceGoalsEvent extends AppEvents {
  final FinanceGoalInput financeGoalInput;

  const PostFinanceGoalsEvent(this.financeGoalInput);

  @override
  List<Object?> get props => [financeGoalInput];
}

class PostFinanceMovementEvent extends AppEvents {
  final FinanceTransactionInput spent;
  final String context;

  const PostFinanceMovementEvent(this.spent, this.context);

  @override
  List<Object?> get props => [spent, context];
}

class PostFinanceNathLimitEvent extends AppEvents {
  final CategoricalNathLimitsCosts limitsCosts;
  final String context;

  const PostFinanceNathLimitEvent(this.limitsCosts, this.context);

  @override
  List<Object?> get props => [limitsCosts, context];
}

class PatchCostListDetailsEvent extends AppEvents {
  final String costId;
  final String category;

  const PatchCostListDetailsEvent(this.costId, this.category);

  @override
  List<Object?> get props => [costId, category];
}