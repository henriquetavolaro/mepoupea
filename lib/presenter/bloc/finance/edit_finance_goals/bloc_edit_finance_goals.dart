import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/edit_finance_goals/state_edit_finance_goals.dart';

import '../../app_events.dart';

class EditFinanceGoalsBloc
    extends Bloc<AppEvents, EditFinanceGoalsState> {
  final EditFinanceGoalsUseCase useCase;

  EditFinanceGoalsBloc(this.useCase)
      : super(EditFinanceGoalsInitialState());

  @override
  Stream<EditFinanceGoalsState> mapEventToState(AppEvents event) async* {
    if (event is EditFinanceGoalsEvent) {
      yield EditFinanceGoalsLoadingState();
      final result = await useCase(event.goal);
      yield result.fold((l) => EditFinanceGoalsErrorState(l),
              (r) => EditFinanceGoalsSuccessState(r));
    }
  }
}
