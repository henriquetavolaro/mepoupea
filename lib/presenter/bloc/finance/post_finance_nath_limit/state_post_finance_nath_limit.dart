import 'package:equatable/equatable.dart';

abstract class PostFinanceNathLimitState extends Equatable{}

class PostFinanceNathLimitInitialState extends PostFinanceNathLimitState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class PostFinanceNathLimitLoadingState extends PostFinanceNathLimitState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceNathLimitSuccessState extends PostFinanceNathLimitState {

  final int statusCode;

  PostFinanceNathLimitSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceNathLimitErrorState extends PostFinanceNathLimitState {

  final Exception exception;

  PostFinanceNathLimitErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}