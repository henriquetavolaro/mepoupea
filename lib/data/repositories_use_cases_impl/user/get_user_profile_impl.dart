import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';

class GetUserProfileImpl implements GetUserProfileUseCase {

  final NetworkService service;

  GetUserProfileImpl(this.service);

  @override
  Future<Either<Exception, UserProfile>> call() async {
    try {
      final result = await service.getUserProfile();
      print('result:: $result');
      return Right(result);
    } catch (e) {
      print('e: $e');
      return Left(Exception(e));

    }
  }



}