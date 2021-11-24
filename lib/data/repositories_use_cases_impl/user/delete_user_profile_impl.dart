import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';

class DeleteUserProfileImpl implements DeleteUserProfileUseCase {

  final NetworkService service;

  DeleteUserProfileImpl(this.service);

  @override
  Future<Either<Exception, int>> call() async {
    try {
      final result = await service.deleteUserProfile();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

}