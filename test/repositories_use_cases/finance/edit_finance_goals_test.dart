import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/edit_finance_goals_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = EditFinanceGoalsImpl(service);

  final financeGoal = FinanceGoal(
      goalId: "goalId",
      presentValue: 0.0,
      goalValue: 0.0,
      date: "date",
      icon: "icon");

  test('should return Right int - code 200', () async {
    when(service.putFinanceGoals(financeGoal)).thenAnswer((
        _) async => 200);

    final result = await useCase(financeGoal);

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.putFinanceGoals(financeGoal)).thenThrow((_) async =>
        Exception());

    final result = await useCase(financeGoal);

    expect(result.fold(id, id), isA<Exception>());
  });
}