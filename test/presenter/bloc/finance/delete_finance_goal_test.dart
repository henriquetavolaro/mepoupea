import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/delete_finance_goal/bloc_delete_finance_goal.dart';
import 'package:mepoupeapp/presenter/bloc/finance/delete_finance_goal/state_delete_finance_goal.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_finance_goal_test.mocks.dart';

@GenerateMocks([DeleteFinanceGoalsUseCase])
main() {

  final useCase = MockDeleteFinanceGoalsUseCase();

  final bloc = DeleteFinanceGoalsBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("goalId")).thenAnswer((_) async => Right(200));
    bloc.add(DeleteFinanceGoalEvent("goalId"));
    expect(bloc.stream, emitsInOrder([
      isA<DeleteFinanceGoalLoadingState>(),
      isA<DeleteFinanceGoalSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase("goalId")).thenAnswer((_) async => Left(Exception()));
    bloc.add(DeleteFinanceGoalEvent("goalId"));
    expect(bloc.stream, emitsInOrder([
      isA<DeleteFinanceGoalLoadingState>(),
      isA<DeleteFinanceGoalErrorState>()
    ]));
  });

}