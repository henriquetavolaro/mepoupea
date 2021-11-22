
import 'package:equatable/equatable.dart';

abstract class PostOnboardAnswerState extends Equatable{}

class PostOnboardAnswerInitialState extends PostOnboardAnswerState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class PostOnboardAnswerLoadingState extends PostOnboardAnswerState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostOnboardAnswerSuccessState extends PostOnboardAnswerState {

  final int statusCode;

  PostOnboardAnswerSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostOnboardAnswerErrorState extends PostOnboardAnswerState {

  final Exception exception;

  PostOnboardAnswerErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}