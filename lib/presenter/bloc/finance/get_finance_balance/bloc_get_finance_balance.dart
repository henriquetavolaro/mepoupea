import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_balance/state_get_finance_balance.dart';

import '../../app_events.dart';

class GetFinanceBalanceBloc
    extends Bloc<AppEvents, GetFinanceBalanceState> {
  final GetFinanceBalanceUseCase useCase;

  GetFinanceBalanceBloc(this.useCase)
      : super(GetFinanceBalanceInitialState());

  @override
  Stream<GetFinanceBalanceState> mapEventToState(AppEvents event) async* {
    if (event is GetFinanceBalanceEvent) {
      yield GetFinanceBalanceLoadingState();
      final result = await useCase();
      yield result.fold((l) => GetFinanceBalanceErrorState(l),
              (r) => GetFinanceBalanceSuccessState(r));
    }
  }
}
