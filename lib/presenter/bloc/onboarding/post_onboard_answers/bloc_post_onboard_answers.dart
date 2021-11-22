import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/post_onboard_answers/state_post_onboard_answers.dart';

import '../../app_events.dart';

class PostOnboardAnswersBloc
    extends Bloc<AppEvents, PostOnboardAnswerState> {
  final PostOnboardAnswersUseCase useCase;

  PostOnboardAnswersBloc(this.useCase)
      : super(PostOnboardAnswerInitialState());

  @override
  Stream<PostOnboardAnswerState> mapEventToState(AppEvents event) async* {
    if (event is PostOnboardingAnswersEvent) {
      yield PostOnboardAnswerLoadingState();
      final result = await useCase(event.answerModel);
      yield result.fold((l) => PostOnboardAnswerErrorState(l),
              (r) => PostOnboardAnswerSuccessState(r));
    }
  }
}
