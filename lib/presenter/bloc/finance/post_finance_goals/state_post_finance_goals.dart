import 'package:equatable/equatable.dart';

abstract class PostFinanceGoalsState extends Equatable{}

class PostFinanceGoalsInitialState extends PostFinanceGoalsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class PostFinanceGoalsLoadingState extends PostFinanceGoalsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceGoalsSuccessState extends PostFinanceGoalsState {

  final int statusCode;

  PostFinanceGoalsSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceGoalsErrorState extends PostFinanceGoalsState {

  final Exception exception;

  PostFinanceGoalsErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}