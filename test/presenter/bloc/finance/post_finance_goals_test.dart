import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_goal_input.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_goals/bloc_post_finance_goals.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_goals/state_post_finance_goals.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_finance_goals_test.mocks.dart';

@GenerateMocks([PostFinanceGoalsUseCase])
main() {

  final useCase = MockPostFinanceGoalsUseCase();

  final bloc = PostFinanceGoalsBloc(useCase);

  final financeGoalInput = FinanceGoalInput(
      actualValue: 0.0,
      goalValue: 0.0,
      valueToSave: 0.0,
      goalType: "goalType",
      importance: "importance",
      dateRange: "dateRange",
      icon: "icon");

  test('should emit loading state and success state', () async {

    when(useCase(financeGoalInput)).thenAnswer((_) async => Right(200));
    bloc.add(PostFinanceGoalsEvent(financeGoalInput));
    expect(bloc.stream, emitsInOrder([
      isA<PostFinanceGoalsLoadingState>(),
      isA<PostFinanceGoalsSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase(financeGoalInput)).thenAnswer((_) async => Left(Exception()));
    bloc.add(PostFinanceGoalsEvent(financeGoalInput));
    expect(bloc.stream, emitsInOrder([
      isA<PostFinanceGoalsLoadingState>(),
      isA<PostFinanceGoalsErrorState>()
    ]));
  });
}