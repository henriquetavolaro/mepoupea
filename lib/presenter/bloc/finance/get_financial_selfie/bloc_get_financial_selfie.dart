import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_categorical_costs/state_get_categorical_costs.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_selfie/state_get_financial_selfie.dart';

import '../../app_events.dart';

class GetFinancialSelfieBloc
    extends Bloc<AppEvents, GetFinancialSelfieState> {
  final GetFinancialSelfieUseCase useCase;

  GetFinancialSelfieBloc(this.useCase)
      : super(GetFinancialSelfieInitialState());

  @override
  Stream<GetFinancialSelfieState> mapEventToState(AppEvents event) async* {
    if (event is GetFinancialSelfieEvent) {
      yield GetFinancialSelfieLoadingState();
      final result = await useCase(event.date);
      yield result.fold((l) => GetFinancialSelfieErrorState(l),
              (r) => GetFinancialSelfieSuccessState(r));
    }
  }
}
