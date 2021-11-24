
import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';

abstract class GetCategoricalCostsState extends Equatable{}

class GetCategoricalCostsInitialState extends GetCategoricalCostsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetCategoricalCostsLoadingState extends GetCategoricalCostsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetCategoricalCostsSuccessState extends GetCategoricalCostsState {

  final CategoricalCosts categoricalCosts;

  GetCategoricalCostsSuccessState(this.categoricalCosts);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetCategoricalCostsErrorState extends GetCategoricalCostsState {

  final Exception exception;

  GetCategoricalCostsErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}