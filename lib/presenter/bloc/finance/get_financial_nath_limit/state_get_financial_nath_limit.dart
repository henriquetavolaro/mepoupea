import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';

abstract class GetFinancialNathLimitState extends Equatable{}

class GetFinancialNathLimitInitialState extends GetFinancialNathLimitState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetFinancialNathLimitLoadingState extends GetFinancialNathLimitState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialNathLimitSuccessState extends GetFinancialNathLimitState {

  final CategoricalNathLimitsCosts categoricalNathLimitsCosts;

  GetFinancialNathLimitSuccessState(this.categoricalNathLimitsCosts);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetFinancialNathLimitErrorState extends GetFinancialNathLimitState {

  final Exception exception;

  GetFinancialNathLimitErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}