import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/domain/model/finance_goal_input.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';

abstract class AppEvents extends Equatable {}

//USER
class DeleteUserProfileEvent extends AppEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditUserProfileEvent extends AppEvents {
  final UserProfileEditable userProfileEditable;

  EditUserProfileEvent(this.userProfileEditable);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetUserProfileEvent extends AppEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// RECOMMENDATIONS

class GetRecommendationCardCategoricalEvent extends AppEvents {
  final String context;

  GetRecommendationCardCategoricalEvent(this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetRecommendationCardEvent extends AppEvents {
  final String context;

  GetRecommendationCardEvent(this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}

// ONBOARDING

class GetOnboardingAnswersEvent extends AppEvents {
  final String lastAnswerId;

  GetOnboardingAnswersEvent(this.lastAnswerId);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostOnboardingAnswersEvent extends AppEvents {
  final AnswerModel answerModel;

  PostOnboardingAnswersEvent(this.answerModel);

  @override
  List<Object?> get props => throw UnimplementedError();
}

// FINANCE

class DeleteFinanceGoalEvent extends AppEvents {
  final String goalId;

  DeleteFinanceGoalEvent(this.goalId);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditFinanceGoalsEvent extends AppEvents {
  final FinanceGoal goal;

  EditFinanceGoalsEvent(this.goal);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetCategoricalCostsEvent extends AppEvents {
  final String date;
  final String context;

  GetCategoricalCostsEvent(this.date, this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceBalanceEvent extends AppEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceGoalsEvent extends AppEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceCostsEvent extends AppEvents {
  final String context;

  GetFinanceCostsEvent(this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialNathLimitEvent extends AppEvents {
  final String context;

  GetFinancialNathLimitEvent(this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialSelfieEvent extends AppEvents {
  final String date;

  GetFinancialSelfieEvent(this.date);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetWealthSelfieEvent extends AppEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceGoalsEvent extends AppEvents {
  final FinanceGoalInput financeGoalInput;

  PostFinanceGoalsEvent(this.financeGoalInput);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceMovementEvent extends AppEvents {
  final FinanceTransactionInput spent;
  final String context;

  PostFinanceMovementEvent(this.spent, this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceNathLimit extends AppEvents {
  final CategoricalNathLimitsCosts limitsCosts;
  final String context;

  PostFinanceNathLimit(this.limitsCosts, this.context);

  @override
  List<Object?> get props => throw UnimplementedError();
}