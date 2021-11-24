import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/post_onboard_answers/bloc_post_onboard_answers.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/post_onboard_answers/state_post_onboard_answers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../datasource/network_service_test.dart';
import 'post_onboard_answer_bloc_test.mocks.dart';

@GenerateMocks([PostOnboardAnswersUseCase])
main(){

  final useCase = MockPostOnboardAnswersUseCase();

  final bloc = PostOnboardAnswersBloc(useCase);

  final answerModel = AnswerModel(pageId: "1");

  test('should emit loading state and success state', () async {

    when(useCase(answerModel)).thenAnswer((_) async => Right(200));
    bloc.add(PostOnboardingAnswersEvent(answerModel));
    expect(bloc.stream, emitsInOrder([
      isA<PostOnboardAnswerLoadingState>(),
      isA<PostOnboardAnswerSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase(answerModel)).thenAnswer((_) async => Left(Exception()));
    bloc.add(PostOnboardingAnswersEvent(answerModel));
    expect(bloc.stream, emitsInOrder([
      isA<PostOnboardAnswerLoadingState>(),
      isA<PostOnboardAnswerErrorState>()
    ]));
  });
}