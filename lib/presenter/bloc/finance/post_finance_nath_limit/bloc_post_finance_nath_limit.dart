import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_nath_limit/state_post_finance_nath_limit.dart';

import '../../app_events.dart';

class PostFinanceNathLimitBloc
    extends Bloc<AppEvents, PostFinanceNathLimitState> {
  final PostFinanceNathLimitUseCase useCase;

  PostFinanceNathLimitBloc(this.useCase)
      : super(PostFinanceNathLimitInitialState());

  @override
  Stream<PostFinanceNathLimitState> mapEventToState(AppEvents event) async* {
    if (event is PostFinanceNathLimitEvent) {
      yield PostFinanceNathLimitLoadingState();
      final result = await useCase(event.limitsCosts, event.context);
      yield result.fold((l) => PostFinanceNathLimitErrorState(l),
              (r) => PostFinanceNathLimitSuccessState(r));
    }
  }
}