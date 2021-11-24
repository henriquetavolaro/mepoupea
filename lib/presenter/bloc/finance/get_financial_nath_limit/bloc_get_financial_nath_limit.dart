import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_categorical_costs/state_get_categorical_costs.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_nath_limit/state_get_financial_nath_limit.dart';

import '../../app_events.dart';

class GetFinancialNathLimitBloc
    extends Bloc<AppEvents, GetFinancialNathLimitState> {
  final GetFinancialNathLimitUseCase useCase;

  GetFinancialNathLimitBloc(this.useCase)
      : super(GetFinancialNathLimitInitialState());

  @override
  Stream<GetFinancialNathLimitState> mapEventToState(AppEvents event) async* {
    if (event is GetFinancialNathLimitEvent) {
      yield GetFinancialNathLimitLoadingState();
      final result = await useCase(event.context);
      yield result.fold((l) => GetFinancialNathLimitErrorState(l),
              (r) => GetFinancialNathLimitSuccessState(r));
    }
  }
}
