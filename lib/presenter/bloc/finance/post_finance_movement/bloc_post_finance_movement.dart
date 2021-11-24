
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_movement/state_post_finance_movement.dart';

import '../../app_events.dart';

class PostFinanceMovementBloc
    extends Bloc<AppEvents, PostFinanceMovementState> {
  final PostFinanceMovementUseCase useCase;

  PostFinanceMovementBloc(this.useCase)
      : super(PostFinanceMovementInitialState());

  @override
  Stream<PostFinanceMovementState> mapEventToState(AppEvents event) async* {
    if (event is PostFinanceMovementEvent) {
      yield PostFinanceMovementLoadingState();
      final result = await useCase(event.spent, event.context);
      yield result.fold((l) => PostFinanceMovementErrorState(l),
              (r) => PostFinanceMovementSuccessState(r));
    }
  }
}