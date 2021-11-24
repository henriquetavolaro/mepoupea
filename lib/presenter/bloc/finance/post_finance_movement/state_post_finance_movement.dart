import 'package:equatable/equatable.dart';

abstract class PostFinanceMovementState extends Equatable{}

class PostFinanceMovementInitialState extends PostFinanceMovementState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class PostFinanceMovementLoadingState extends PostFinanceMovementState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceMovementSuccessState extends PostFinanceMovementState {

  final int statusCode;

  PostFinanceMovementSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostFinanceMovementErrorState extends PostFinanceMovementState {

  final Exception exception;

  PostFinanceMovementErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}