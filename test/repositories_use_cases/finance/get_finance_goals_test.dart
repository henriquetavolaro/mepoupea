import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/get_finance_goals_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class FinanceGoalsMock extends Mock implements FinanceGoals{}

main(){

  final service = MockNetworkService();

  final useCase = GetFinanceGoalsImpl(service);

  test('should return Right FinanceGoals', () async {
    when(service.getFinanceGoals()).thenAnswer((_) async => FinanceGoalsMock());

    final result = await useCase();

    expect(result.fold(id, id), isA<FinanceGoals>());
  });

  test('should return Left Exception', () async {
    when(service.getFinanceGoals()).thenThrow((_) async => Exception());

    final result = await useCase();

    expect(result.fold(id, id), isA<Exception>());
  });

}