import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/get_onboard_answers/bloc_get_onboard_answers.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/get_onboard_answers/state_get_onboard_answers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../datasource/network_service_test.dart';
import 'get_onboard_answer_bloc_test.mocks.dart';

@GenerateMocks([GetOnboardAnswersUseCase])
main(){

  final useCase = MockGetOnboardAnswersUseCase();

  final bloc = GetOnboardAnswersBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("context")).thenAnswer((_) async => Right(OnboardModelMock()));
    bloc.add(GetOnboardingAnswersEvent("lastItemId"));
    expect(bloc.stream, emitsInOrder([
      isA<GetOnboardAnswerLoadingState>(),
      isA<GetOnboardAnswerSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase("context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetOnboardingAnswersEvent("lastItemId"));
    expect(bloc.stream, emitsInOrder([
      isA<GetOnboardAnswerLoadingState>(),
      isA<GetOnboardAnswerErrorState>()
    ]));
  });
}