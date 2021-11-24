import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/finance_balance.dart';

abstract class GetFinanceBalanceState extends Equatable{}

class GetFinanceBalanceInitialState extends GetFinanceBalanceState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetFinanceBalanceLoadingState extends GetFinanceBalanceState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceBalanceSuccessState extends GetFinanceBalanceState {

  final FinanceBalance financeBalance;

  GetFinanceBalanceSuccessState(this.financeBalance);


  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinanceBalanceErrorState extends GetFinanceBalanceState {

  final Exception exception;

  GetFinanceBalanceErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}