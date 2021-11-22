
import 'package:equatable/equatable.dart';

abstract class DeleteUserProfileState extends Equatable{}

class DeleteUserProfileInitialState extends DeleteUserProfileState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class DeleteUserProfileLoadingState extends DeleteUserProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteUserProfileSuccessState extends DeleteUserProfileState {

  final int statusCode;

  DeleteUserProfileSuccessState(this.statusCode);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteUserProfileErrorState extends DeleteUserProfileState {

  final Exception exception;

  DeleteUserProfileErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}