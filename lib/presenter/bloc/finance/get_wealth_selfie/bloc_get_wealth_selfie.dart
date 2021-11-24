import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_wealth_selfie/state_get_wealth_selfie.dart';

import '../../app_events.dart';

class GetWealthSelfieBloc
    extends Bloc<AppEvents, GetWealthSelfieState> {
  final GetWealthSelfieUseCase useCase;

  GetWealthSelfieBloc(this.useCase)
      : super(GetWealthSelfieInitialState());

  @override
  Stream<GetWealthSelfieState> mapEventToState(AppEvents event) async* {
    if (event is GetWealthSelfieEvent) {
      yield GetWealthSelfieLoadingState();
      final result = await useCase();
      yield result.fold((l) => GetWealthSelfieErrorState(l),
              (r) => GetWealthSelfieSuccessState(r));
    }
  }
}
