import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';

class EditUserProfileImpl implements EditUserProfileUseCase {

  final NetworkService service;

  EditUserProfileImpl(this.service);

  @override
  Future<Either<Exception, int>> call(UserProfileEditable userProfileEditable) async {
    try {
      final result = await service.putUserProfile(userProfileEditable);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

}