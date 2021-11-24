import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/edit_finance_goals/bloc_edit_finance_goals.dart';
import 'package:mepoupeapp/presenter/bloc/finance/edit_finance_goals/state_edit_finance_goals.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_finance_goal_test.mocks.dart';

@GenerateMocks([EditFinanceGoalsUseCase])
main() {

  final useCase = MockEditFinanceGoalsUseCase();

  final bloc = EditFinanceGoalsBloc(useCase);

  final financeGoal = FinanceGoal(
      goalId: "goalId",
      presentValue: 0.0,
      goalValue: 0.0,
      date: "date",
      icon: "icon");

  test('should emit loading state and success state', () async {

    when(useCase(financeGoal)).thenAnswer((_) async => Right(200));
    bloc.add(EditFinanceGoalsEvent(financeGoal));
    expect(bloc.stream, emitsInOrder([
      isA<EditFinanceGoalsLoadingState>(),
      isA<EditFinanceGoalsSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase(financeGoal)).thenAnswer((_) async => Left(Exception()));
    bloc.add(EditFinanceGoalsEvent(financeGoal));
    expect(bloc.stream, emitsInOrder([
      isA<EditFinanceGoalsLoadingState>(),
      isA<EditFinanceGoalsErrorState>()
    ]));
  });


}