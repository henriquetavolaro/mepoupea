import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/model/costs_list.dart';

abstract class GetFinancialCostsState extends Equatable{}

class GetFinancialCostsInitialState extends GetFinancialCostsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetFinancialCostsLoadingState extends GetFinancialCostsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialCostsSuccessState extends GetFinancialCostsState {

  final CostsList costsList;

  GetFinancialCostsSuccessState(this.costsList);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialCostsErrorState extends GetFinancialCostsState {

  final Exception exception;

  GetFinancialCostsErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}