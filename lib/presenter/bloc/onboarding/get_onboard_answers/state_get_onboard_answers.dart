import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';

abstract class GetOnboardAnswerState extends Equatable{}

class GetOnboardAnswerInitialState extends GetOnboardAnswerState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetOnboardAnswerLoadingState extends GetOnboardAnswerState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetOnboardAnswerSuccessState extends GetOnboardAnswerState {

  final OnboardModel onboardModel;

  GetOnboardAnswerSuccessState(this.onboardModel);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetOnboardAnswerErrorState extends GetOnboardAnswerState {

  final Exception exception;

  GetOnboardAnswerErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}