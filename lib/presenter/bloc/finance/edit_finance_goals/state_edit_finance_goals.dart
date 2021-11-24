import 'package:equatable/equatable.dart';

abstract class EditFinanceGoalsState extends Equatable{}

class EditFinanceGoalsInitialState extends EditFinanceGoalsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class EditFinanceGoalsLoadingState extends EditFinanceGoalsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditFinanceGoalsSuccessState extends EditFinanceGoalsState {

  final int statusCode;

  EditFinanceGoalsSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditFinanceGoalsErrorState extends EditFinanceGoalsState {

  final Exception exception;

  EditFinanceGoalsErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}