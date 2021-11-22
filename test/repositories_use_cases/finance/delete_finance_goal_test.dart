import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/delete_finance_goal_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = DeleteFinanceGoalImpl(service);

  test('should return Right int - code 200', () async {
    when(service.deleteFinanceGoals("goalId")).thenAnswer((_) async => 200);

    final result = await useCase("goalId");

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.deleteFinanceGoals("goalId")).thenThrow((_) async => Exception());

    final result = await useCase("goalId");

    expect(result.fold(id, id), isA<Exception>());
  });
}