import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_categorical_costs/state_get_categorical_costs.dart';

import '../../app_events.dart';

class GetCategoricalCostsBloc
    extends Bloc<AppEvents, GetCategoricalCostsState> {
  final GetCategoricalCostsUseCase useCase;

  GetCategoricalCostsBloc(this.useCase)
      : super(GetCategoricalCostsInitialState());

  @override
  Stream<GetCategoricalCostsState> mapEventToState(AppEvents event) async* {
    if (event is GetCategoricalCostsEvent) {
      yield GetCategoricalCostsLoadingState();
      final result = await useCase(event.date, event.context);
      yield result.fold((l) => GetCategoricalCostsErrorState(l),
              (r) => GetCategoricalCostsSuccessState(r));
    }
  }
}
