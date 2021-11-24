
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/patch_cost_list_details/state_patch_cost_list_details.dart';

import '../../app_events.dart';

class PatchCostListDetailsBloc
    extends Bloc<AppEvents, PatchCostListDetailsState> {
  final PatchCostListDetailsUseCase useCase;

  PatchCostListDetailsBloc(this.useCase)
      : super(PatchCostListDetailsInitialState());

  @override
  Stream<PatchCostListDetailsState> mapEventToState(AppEvents event) async* {
    if (event is PatchCostListDetailsEvent) {
      yield PatchCostListDetailsLoadingState();
      final result = await useCase(event.costId, event.category);
      yield result.fold((l) => PatchCostListDetailsErrorState(l),
              (r) => PatchCostListDetailsSuccessState(r));
    }
  }
}
