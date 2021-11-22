import 'package:equatable/equatable.dart';

abstract class EditUserProfileState extends Equatable{}

class EditUserProfileInitialState extends EditUserProfileState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class EditUserProfileLoadingState extends EditUserProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditUserProfileSuccessState extends EditUserProfileState {

  final int statusCode;

  EditUserProfileSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditUserProfileErrorState extends EditUserProfileState {

  final Exception exception;

  EditUserProfileErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}