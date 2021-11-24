import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';

class GetOnboardAnswersImpl implements GetOnboardAnswersUseCase {

  final NetworkService service;

  GetOnboardAnswersImpl(this.service);

  @override
  Future<Either<Exception, OnboardModel>> call(String lastAnswerId) async {
    try {
      final result = await service.getOnboardingAnswer(lastAnswerId);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }
  }


}
