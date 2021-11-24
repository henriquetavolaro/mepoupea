import 'package:equatable/equatable.dart';

abstract class PatchCostListDetailsState extends Equatable{}

class PatchCostListDetailsInitialState extends PatchCostListDetailsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class PatchCostListDetailsLoadingState extends PatchCostListDetailsState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PatchCostListDetailsSuccessState extends PatchCostListDetailsState {

  final int statusCode;

  PatchCostListDetailsSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PatchCostListDetailsErrorState extends PatchCostListDetailsState {

  final Exception exception;

  PatchCostListDetailsErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}
