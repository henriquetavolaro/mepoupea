import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/finance_selfie.dart';

abstract class GetFinancialSelfieState extends Equatable{}

class GetFinancialSelfieInitialState extends GetFinancialSelfieState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetFinancialSelfieLoadingState extends GetFinancialSelfieState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialSelfieSuccessState extends GetFinancialSelfieState {

  final FinanceSelfie financeSelfie;

  GetFinancialSelfieSuccessState(this.financeSelfie);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialSelfieErrorState extends GetFinancialSelfieState {

  final Exception exception;

  GetFinancialSelfieErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}