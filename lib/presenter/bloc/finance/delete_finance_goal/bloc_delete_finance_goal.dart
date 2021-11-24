import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/delete_finance_goal/state_delete_finance_goal.dart';

import '../../app_events.dart';

class DeleteFinanceGoalsBloc
    extends Bloc<AppEvents, DeleteFinanceGoalState> {
  final DeleteFinanceGoalsUseCase useCase;

  DeleteFinanceGoalsBloc(this.useCase)
      : super(DeleteFinanceGoalInitialState());

  @override
  Stream<DeleteFinanceGoalState> mapEventToState(AppEvents event) async* {
    if (event is DeleteFinanceGoalEvent) {
      yield DeleteFinanceGoalLoadingState();
      final result = await useCase(event.goalId);
      yield result.fold((l) => DeleteFinanceGoalErrorState(l),
              (r) => DeleteFinanceGoalSuccessState(r));
    }
  }
}
