import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_goals/state_get_finance_goals.dart';

import '../../app_events.dart';

class GetFinanceGoalsBloc
    extends Bloc<AppEvents, GetFinanceGoalsState> {
  final GetFinanceGoalsUseCase useCase;

  GetFinanceGoalsBloc(this.useCase)
      : super(GetFinanceGoalsInitialState());

  @override
  Stream<GetFinanceGoalsState> mapEventToState(AppEvents event) async* {
    if (event is GetFinanceGoalsEvent) {
      yield GetFinanceGoalsLoadingState();
      final result = await useCase();
      yield result.fold((l) => GetFinanceGoalsErrorState(l),
              (r) => GetFinanceGoalsSuccessState(r));
    }
  }
}
