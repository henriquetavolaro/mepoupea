import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';

abstract class GetWealthSelfieState extends Equatable{}

class GetWealthSelfieInitialState extends GetWealthSelfieState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetWealthSelfieLoadingState extends GetWealthSelfieState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetWealthSelfieSuccessState extends GetWealthSelfieState {

  final WealthSelfie wealthSelfie;

  GetWealthSelfieSuccessState(this.wealthSelfie);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetWealthSelfieErrorState extends GetWealthSelfieState {

  final Exception exception;

  GetWealthSelfieErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}
