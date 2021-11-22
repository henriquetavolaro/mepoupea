import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';

abstract class GetOnboardAnswersUseCase {
  Future<Either<Exception, OnboardModel>> call(String lastAnswerId);
}

abstract class PostOnboardAnswersUseCase {
  Future<Either<Exception, int>> call(AnswerModel answerModel);
}

