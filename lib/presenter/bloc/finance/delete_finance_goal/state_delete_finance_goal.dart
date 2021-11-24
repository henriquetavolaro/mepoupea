import 'package:equatable/equatable.dart';

abstract class DeleteFinanceGoalState extends Equatable{}

class DeleteFinanceGoalInitialState extends DeleteFinanceGoalState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class DeleteFinanceGoalLoadingState extends DeleteFinanceGoalState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteFinanceGoalSuccessState extends DeleteFinanceGoalState {

  final int statusCode;

  DeleteFinanceGoalSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteFinanceGoalErrorState extends DeleteFinanceGoalState {

  final Exception exception;

  DeleteFinanceGoalErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}