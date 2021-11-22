import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';

abstract class GetUserProfileUseCase {
  Future<Either<Exception, UserProfile>> call();
}

abstract class EditUserProfileUseCase {
  Future<Either<Exception, int>> call(UserProfileEditable userProfileEditable);
}

abstract class DeleteUserProfileUseCase {
  Future<Either<Exception, int>> call();
}

abstract class PostImageProfileUseCase {

  //TODO

}
abstract class PostImageSelfieUseCase {

  //TODO

}