import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';

abstract class GetFinanceGoalsState extends Equatable{}

class GetFinanceGoalsInitialState extends GetFinanceGoalsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetFinanceGoalsLoadingState extends GetFinanceGoalsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceGoalsSuccessState extends GetFinanceGoalsState {

  final FinanceGoals financeGoals;

  GetFinanceGoalsSuccessState(this.financeGoals);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceGoalsErrorState extends GetFinanceGoalsState {

  final Exception exception;

  GetFinanceGoalsErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}