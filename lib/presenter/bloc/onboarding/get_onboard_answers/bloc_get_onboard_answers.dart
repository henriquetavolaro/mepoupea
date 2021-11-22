import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/get_onboard_answers/state_get_onboard_answers.dart';

import '../../app_events.dart';

class GetOnboardAnswersBloc
    extends Bloc<AppEvents, GetOnboardAnswerState> {
  final GetOnboardAnswersUseCase useCase;

  GetOnboardAnswersBloc(this.useCase)
      : super(GetOnboardAnswerInitialState());

  @override
  Stream<GetOnboardAnswerState> mapEventToState(AppEvents event) async* {
    if (event is GetOnboardingAnswersEvent) {
      yield GetOnboardAnswerLoadingState();
      final result = await useCase(event.lastAnswerId);
      yield result.fold((l) => GetOnboardAnswerErrorState(l),
              (r) => GetOnboardAnswerSuccessState(r));
    }
  }
}
