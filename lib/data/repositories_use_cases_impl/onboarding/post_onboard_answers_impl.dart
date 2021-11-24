import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';

class PostOnboardAnswersImpl extends PostOnboardAnswersUseCase {

  final NetworkService service;

  PostOnboardAnswersImpl(this.service);

  @override
  Future<Either<Exception, int>> call(AnswerModel answerModel) async {
    try {
      final result = await service.postOnboardingAnswer(answerModel);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }
  }

}