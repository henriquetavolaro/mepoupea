import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_costs/state_get_financial_costs.dart';

import '../../app_events.dart';

class GetFinancialCostsBloc
    extends Bloc<AppEvents, GetFinancialCostsState> {
  final GetFinancialCostsUseCase useCase;

  GetFinancialCostsBloc(this.useCase)
      : super(GetFinancialCostsInitialState());

  @override
  Stream<GetFinancialCostsState> mapEventToState(AppEvents event) async* {
    if (event is GetFinancialCostsEvent) {
      yield GetFinancialCostsLoadingState();
      final result = await useCase(event.context);
      yield result.fold((l) => GetFinancialCostsErrorState(l),
              (r) => GetFinancialCostsSuccessState(r));
    }
  }
}
