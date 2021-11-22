import 'package:equatable/equatable.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';

abstract class GetUserProfileState extends Equatable{}

class GetUserProfileInitialState extends GetUserProfileState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetUserProfileLoadingState extends GetUserProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetUserProfileSuccessState extends GetUserProfileState {

  final UserProfile userProfile;

  GetUserProfileSuccessState(this.userProfile);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetUserProfileErrorState extends GetUserProfileState {

  final Exception exception;

  GetUserProfileErrorState(this.exception);

  @override
  List<Object?> get props => throw UnimplementedError();
}