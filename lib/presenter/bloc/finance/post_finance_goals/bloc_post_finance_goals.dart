
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_goals/state_post_finance_goals.dart';

import '../../app_events.dart';

class PostFinanceGoalsBloc
    extends Bloc<AppEvents, PostFinanceGoalsState> {
  final PostFinanceGoalsUseCase useCase;

  PostFinanceGoalsBloc(this.useCase)
      : super(PostFinanceGoalsInitialState());

  @override
  Stream<PostFinanceGoalsState> mapEventToState(AppEvents event) async* {
    if (event is PostFinanceGoalsEvent) {
      yield PostFinanceGoalsLoadingState();
      final result = await useCase(event.financeGoalInput);
      yield result.fold((l) => PostFinanceGoalsErrorState(l),
              (r) => PostFinanceGoalsSuccessState(r));
    }
  }
}